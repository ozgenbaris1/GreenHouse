class Sensor {
  int sensorID;
  String name;
  String createdDate;
  String unitSymbol;

  Sensor({this.sensorID, this.name, this.createdDate, this.unitSymbol});
}

/*
Sensor.fromJson(Map json)
      : sensorID = json['SensorID'],
        name = json['Name'],
        createdDate = json['CreatedDate'];

  Map toJson() {
    return {'SensorID': sensorID, 'Name': name, 'CreatedDate': createdDate};
  }
*/
