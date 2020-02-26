import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.1.3:8080";

class API {
  static getDevices() async {
    var url = baseUrl + "/getDevices";
    final res = await http.get(url);
    return json.decode(res.body);
  }

  static getLastSensorData(int deviceID) async {
    var url = baseUrl + "/getLastSensorDataOfDevice?deviceID=$deviceID";
    final res = await http.get(url);
    return json.decode(res.body);
  }

  static getAllSensorData(int deviceID) async {
    var url = baseUrl + "/getAllSensorDataOfDevice?deviceID=$deviceID";
    final res = await http.get(url);
    return json.decode(res.body);
  }
}
