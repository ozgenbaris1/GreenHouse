import 'package:flutter/material.dart';
import 'package:green_house_app/models/Device.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';
import 'package:green_house_app/widgets/DeviceItem.dart';
import 'package:provider/provider.dart';

import '../pages/ChartScreen.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChartScreen()),
                    );
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
