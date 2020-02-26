import 'dart:core';

import 'Device.dart';
import 'Sensor.dart';

class SensorData {
  Device _device;
  Sensor _sensor;
  double _value;
  String _createdDate;

  Device get device{
    return _device;
  }

  Sensor get sensor{
    return _sensor;
  }

  double get value{
    return _value;
  }

  String get createdDate{
    return _createdDate;
  }

  SensorData({device, sensor, value, createdDate}){
    _device = device;
    _sensor = sensor;
    _value = value;
    _createdDate = createdDate;
  }
}