const sqlite3 = require('better-sqlite3');
const DATABASE_PATH = '../Database/GreenHouseDB.db';

module.exports = function() {

    this.getDevices = function() {
        var database = new sqlite3(DATABASE_PATH);

        var response = database.prepare(`SELECT * FROM Devices`).all();
        database.close();

        if (response.length < 1) {
            return { type: 'E', message: 'No devices found.', data: null };
        } else {
            return { type: 'S', message: null, data: response };
        }
    };

    this.getSensors = function() {
        var database = new sqlite3(DATABASE_PATH);

        var response = database.prepare(`SELECT * FROM Sensors`).all();
        database.close();

        if (response.length == 0) return { type: 'E', message: 'No sensors found.', data: null };
        return { type: 'S', message: null, data: response };
    };

    this.getLastSensorDataOfDevice = function(deviceID) {

        var database = new sqlite3(DATABASE_PATH);

        var response = database.prepare(`SELECT * FROM GetLastDataVW WHERE DeviceID = ${deviceID};`).all();
        database.close();

        response.forEach(item => {

            item.Value = item.Value.toFixed(1);

        });

        if (response.length == 0)
            return { type: 'E', message: 'No sensor data found.', data: null };
        else
            return { type: 'S', message: null, data: response };

    };

    this.getAllSensorDataOfDevice = function(deviceID) {

        var database = new sqlite3(DATABASE_PATH);

        var sensorsResponse = database.prepare(`SELECT SensorID, Name, UnitSymbol FROM Sensors WHERE SensorID IN ( Select SensorID from ConnectedSensorsToDevices WHERE DeviceID = ${deviceID});`).all();

        var array = [];

        sensorsResponse.forEach(item => {

            var sensorDataResponse = database.prepare(`SELECT Value, CreatedDate FROM GetAllDataVW WHERE DeviceID = ${deviceID} AND SensorID = ${item.SensorID};`).all();

            delete item.SensorID

            sensorDataResponse.forEach(item => {
                item.Value = item.Value.toFixed(1);
            });

            array.push({
                sensor: item,
                sensorData: sensorDataResponse
            });

        });

        database.close();

        if (array.length == 0)
            return { type: 'E', message: 'No sensor data found.', data: null };
        else
            return { type: 'S', message: null, data: array };

    };

    this.postSensorDataToDB = function(data) {

        var database = new sqlite3(DATABASE_PATH);
        var response = database.prepare(`
                INSERT INTO SensorDatas (
                     DeviceID, 
                     SensorID, 
                     Value)
                VALUES ( ?,?,? )`).run(
            data.DeviceID,
            data.SensorID,
            data.Value
        );

        database.close();

        return response;
    };


}