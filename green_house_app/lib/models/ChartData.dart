import 'package:green_house_app/models/Sensor.dart';
import 'package:green_house_app/models/SensorData.dart';

class ChartData {
  Sensor sensor;
  List<SensorData> sensorData;

  ChartData({this.sensor, this.sensorData});
}