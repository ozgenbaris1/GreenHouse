import 'dart:async';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/API.dart';
import 'package:green_house_app/models/ChartData.dart';
import 'package:green_house_app/models/Sensor.dart';
import 'package:green_house_app/models/SensorData.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';

class ChartProvider with ChangeNotifier {
  List<ChartData> chartData;

  initTimer() {
    Timer.periodic(new Duration(seconds: 2), (timer) {
      getChartData();
    });
  }

  Future<void> getChartData() async {
    try {
      final response =
          await API.getAllSensorData(DeviceProvider.currentDevice.deviceID);

      if (response['type'] == "S") {
        Iterable array = response['data'];

        chartData = new List<ChartData>();

        array.forEach(
          (item) {
            Sensor sensor = new Sensor(
                name: item['sensor']['Name'],
                unitSymbol: item['sensor']['UnitSymbol']);

            List<SensorData> sensorDataList = item['sensorData']
                .map<SensorData>(
                  (item) => SensorData(
                      value: double.parse(item['Value']),
                      createdDate: item['CreatedDate']),
                )
                .toList();

            chartData.add(
              new ChartData(sensor: sensor, sensorData: sensorDataList),
            );
          },
        );

        notifyListeners();
      }
    } catch (error) {
      print('ChartProvider : ');
      print(error);
    }
  }
}
