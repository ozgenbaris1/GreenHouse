import 'package:flutter/material.dart';
import 'package:green_house_app/models/ArrowType.dart';
import 'package:green_house_app/models/SensorData.dart';
import 'package:green_house_app/widgets/SensorItem.dart';

class SensorList extends StatelessWidget {
  List<SensorData> _sensorDataList;

  SensorList(List<SensorData> sensorDataList) {
    _sensorDataList = sensorDataList;
  }

  @override
  Widget build(BuildContext context) {
    if (_sensorDataList == null) {
      return Text(
        'No Sensor Data',
        style: TextStyle(color: Colors.red),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _sensorDataList.map<Widget>(
          (currentItem) {
            // ArrowType arrowType = getArrowType(previousItem.value, currentItem.value);
            ArrowType arrowType = ArrowType.down;
            return SensorItem(
              icon: 'temperature',
              title: currentItem.sensor.name,
              value: currentItem.value == null
                  ? "..."
                  : "${currentItem.value} ${currentItem.sensor.unitSymbol}",
              arrowType: arrowType,
              // border: Border.all(color: Colors.green),
            );
          },
        ).toList(),
      ),
    );
  }

  ArrowType getArrowType(double previousValue, double currentValue) {
    ArrowType arrowType;

    if (previousValue < currentValue) {
      arrowType = ArrowType.up;
    } else if (previousValue > currentValue) {
      arrowType = ArrowType.down;
    } else {
      arrowType = ArrowType.equals;
    }

    return arrowType;
  }
}
