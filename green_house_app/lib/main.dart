import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/pages/HomeScreen.dart';
import 'package:green_house_app/providers/ChartProvider.dart';
import 'package:green_house_app/providers/SensorDataProvider.dart';
import 'package:provider/provider.dart';
import 'providers/DeviceProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DeviceProvider()),
        ChangeNotifierProvider(create: (context) => SensorDataProvider()),
        ChangeNotifierProvider(create: (context) => ChartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
