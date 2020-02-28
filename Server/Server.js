require('./Tools')();
const express = require('express');
const bodyParser = require('body-parser');
const PORT = 8080;
const app = express();

var ip = require("ip");
const IPADDRESS = ip.address()

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/getDevices', (_req, res) => {
    res.send(getDevices());
});

app.get('/getSensors', (_req, res) => {
    res.send(getSensors());
});

app.get('/getLastSensorDataOfDevice', (req, res) => {

    var deviceID = req.query.deviceID;

    if (!(deviceID)) {
        res.send("Invalid Parameters");
    } else {
        res.send(getLastSensorDataOfDevice(deviceID))
    }

});

app.get('/getAllSensorDataOfDevice', (req, res) => {

    var deviceID = req.query.deviceID;
    var sensorID = req.query.sensorID;

    if (!(deviceID)) {
        res.send("Invalid Parameters");
    } else {
        res.send(getAllSensorDataOfDevice(deviceID, sensorID))
    }

});

app.get('/getDeviceAndSensors', (req, res) => {

    var deviceID = req.query.deviceID;
    var sensorID = req.query.sensorID;

    if (!(deviceID)) {
        res.send("Invalid Parameters");
    } else {
        res.send(getDeviceAndSensors(deviceID, sensorID))
    }

});


/*
app.post('/postSensorData', (req, res) => {
    res.json(postSensorData(req.body));
});
*/

app.listen(PORT, () => {
    console.log(`Server running at: http://${IPADDRESS}:${PORT}/`);
});