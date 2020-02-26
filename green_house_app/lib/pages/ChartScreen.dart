import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/Colors.dart';
import 'package:green_house_app/pages/ChartDetailScreen.dart';
import 'package:green_house_app/providers/ChartProvider.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';
import 'package:green_house_app/widgets/ChartItem.dart';
import 'package:green_house_app/widgets/ChartList.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  createState() => _ChartScreen();
}

class _ChartScreen extends State {
  List<double> randomList;

  @override
  initState() {
    super.initState();
    randomList = getListOfData();
    initDataProviders();
  }

  initDataProviders() async {
    await Provider.of<ChartProvider>(context, listen: false).initTimer();
  }

  @override
  build(context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: MyColors.headerTextColor),
        backgroundColor: MyColors.appBarColor,
        title: Text(
          DeviceProvider.currentDevice.name,
          style: TextStyle(color: MyColors.headerTextColor),
        ),
      ),
      body: Container(
        child: Consumer<ChartProvider>(
          builder: (ctx, chartProvider, _) =>
              ChartList(chartData: chartProvider.chartData),
        ),
      ),
      // bottomNavigationBar: NavigationBarWidget(),
    );
  }

  List<double> getListOfData() {
    List<double> list = new List<double>();

    var rng = new Random();
    for (var i = 0; i < 50; i++) {
      list.add(rng.nextDouble() * 10);
    }

    return list;
  }
}
