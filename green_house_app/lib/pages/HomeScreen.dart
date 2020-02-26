import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/Colors.dart';
import 'package:green_house_app/pages/ChartScreen.dart';
import 'package:green_house_app/pages/DevicesScreen.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';
import 'package:green_house_app/providers/SensorDataProvider.dart';
import 'package:green_house_app/widgets/SensorList.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => _HomeScreen();
}

class _HomeScreen extends State {
  @override
  initState() {
    super.initState();
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<DeviceProvider>(context, listen: false).initTimer();
    await Provider.of<SensorDataProvider>(context, listen: false).initTimer();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: MyColors.headerTextColor),
        backgroundColor: MyColors.appBarColor,
        title: Text(
          "Green House",
          style: TextStyle(color: MyColors.headerTextColor),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.devices),
            onPressed: () {
              print('Pressed Appbar');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DevicesScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print('Pressed Appbar');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChartScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: MyColors.backgroundColor),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<DeviceProvider>(
          builder: (ctx, sensorDataProvider, _) {
            Provider.of<SensorDataProvider>(context, listen: false)
                .getLastSensorData();
            return Container(
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      DeviceProvider.currentDevice == null
                          ? ""
                          : DeviceProvider.currentDevice.name,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Consumer<SensorDataProvider>(
                    builder: (ctx, sensorDataProvider, _) =>
                        SensorList(sensorDataProvider.currentSensorDataList),
                  ),
                  SizedBox(height: 1)
                ],
              ),
            );
          },
        ),
      ),
      // bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
