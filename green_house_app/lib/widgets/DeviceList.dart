import 'package:flutter/material.dart';
import 'package:green_house_app/models/ChartData.dart';
import 'package:green_house_app/models/Device.dart';
import 'package:green_house_app/pages/ChartDetailScreen.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';
import 'package:green_house_app/widgets/ChartItem.dart';
import 'package:green_house_app/widgets/DeviceItem.dart';
import 'package:provider/provider.dart';

class DeviceList extends StatelessWidget {
  final List<Device> deviceData;

  const DeviceList({@required this.deviceData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: deviceData
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                FlatButton(
                  onPressed: () {
                    Provider.of<DeviceProvider>(context, listen: false)
                        .setCurrentDevice(index);
                    Navigator.pop(context);
                  },
                  child: DeviceItem(
                    name: item.name,
                    isOnline: item.isOnline,
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
