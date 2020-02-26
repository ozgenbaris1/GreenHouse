import 'dart:async';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/API.dart';
import 'package:green_house_app/models/Device.dart';
import 'package:green_house_app/models/Sensor.dart';
import 'package:green_house_app/models/SensorData.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';

class SensorDataProvider with ChangeNotifier {
  List<SensorData> currentSensorDataList;
  List<SensorData> previousSensorDataList;

  initTimer() {
    getLastSensorData();
    Timer.periodic(new Duration(seconds: 10), (timer) {
      getLastSensorData();
    });
  }

  Future<void> getLastSensorData() async {
    try {
      if (DeviceProvider.currentDevice.deviceID == null) {
        return;
      }

      final response =
          await API.getLastSensorData(DeviceProvider.currentDevice.deviceID);

      if (response['type'] != 'E') {
        Iterable list = response['data'];

        previousSensorDataList = currentSensorDataList;

        this.currentSensorDataList = list
            .map(
              (item) => SensorData(
                  device: new Device(
                    deviceID: item['DeviceID'],
                    name: item['DeviceName'],
                  ),
                  sensor: new Sensor(
                    sensorID: item['SensorID'],
                    name: item['SensorName'],
                    unitSymbol: item['UnitSymbol'],
                  ),
                  value: double.parse(item['Value']),
                  createdDate: item['CreatedDate']),
            )
            .toList();

        // print(this.currentSensorDataList);
      } else {
        this.currentSensorDataList = null;
      }
      notifyListeners();
    } catch (error) {
      print('SensorProvider : ');
      print(error);
    }
  }
}
