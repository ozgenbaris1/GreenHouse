import 'dart:async';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/API.dart';
import 'package:green_house_app/models/Device.dart';

class DeviceProvider with ChangeNotifier {
  static List<Device> _deviceList;
  static Device _currentDevice;
  static Device get currentDevice {
    return _currentDevice;
  }

  List<Device> get deviceList {
    return _deviceList;
  }

  initTimer() {
    Timer.periodic(new Duration(seconds: 2), (timer) {
      getDevices();
    });
  }

  Future<void> getDevices() async {
    try {
      final response = await API.getDevices();

      if (response['type'] == "S") {
        Iterable list = response['data'];

        _deviceList = list
            .map(
              (item) => Device(
                deviceID: item['DeviceID'],
                name: item['Name'],
                createdDate: item['CreatedDate'],
                isOnline: item['IsOnline'],
              ),
            )
            .toList();

        if (_currentDevice == null) {
          _currentDevice = _deviceList[0];
        }

        // print(_deviceList);

        notifyListeners();
      }
    } catch (error) {
      print('DeviceProvider : ');
      print(error);
    }
  }

  setCurrentDevice(int index) {
    _currentDevice = _deviceList[index];
    notifyListeners();
  }
}
