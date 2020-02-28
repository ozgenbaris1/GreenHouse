import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/Colors.dart';
import 'package:green_house_app/providers/ChartProvider.dart';
import 'package:green_house_app/providers/DeviceProvider.dart';
import 'package:green_house_app/widgets/ChartList.dart';
import 'package:green_house_app/widgets/DeviceList.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatefulWidget {
  @override
  createState() => _DevicesScreen();
}

class _DevicesScreen extends State {
  initState() {
    Provider.of<DeviceProvider>(context, listen: false).getDevices();
    super.initState();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        actionsIconTheme: IconThemeData(color: MyColors.headerTextColor),
        title: Text(
          "Devices",
          style: TextStyle(color: MyColors.headerTextColor),
        ),
      ),
      body: Container(
        child: Consumer<DeviceProvider>(
          builder: (ctx, deviceProvider, _) =>
              DeviceList(deviceData: deviceProvider.deviceList),
        ),
      ),
      // bottomNavigationBar: NavigationBarWidget(),
    );
  }

  setOnlineIcon(int isOnline) {
    if (isOnline == 1) {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.lightGreenAccent[400],
        size: 30,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.red,
        size: 30,
      );
    }
  }
}

// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: MyColors.appBarColor,
//     title: Text("Devices"),
//   ),
//   body: Container(
//       color: MyColors.backgroundColor,
//       child: Consumer<DeviceProvider>(
//         builder: (ctx, deviceProvider, _) => ListView.builder(
//           itemCount: deviceProvider.deviceList == null
//               ? 0
//               : deviceProvider.deviceList.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Provider.of<DeviceProvider>(context, listen: false)
//                     .setCurrentDevice(index);
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 margin: EdgeInsets.only(bottom: 15),
//                 decoration: BoxDecoration(
//                   // color: MyColors.deviceItem,
//                   border: Border(
//                     top: BorderSide(
//                         color: MyColors.headerTextColor, width: 2),
//                     bottom: BorderSide(
//                         color: MyColors.headerTextColor, width: 2),
//                   ),
//                   // borderRadius: BorderRadius.all(Radius.circular(100)),
//                 ),
//                 child: ListTile(
//                   title: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     child: Text(
//                       deviceProvider.deviceList[index].name.toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                   ),
//                   subtitle: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     child: Text(
//                       'Sensor1, Sensor2, Sensor3',
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                   trailing: Container(
//                     padding: EdgeInsets.only(right: 15),
//                     child: setOnlineIcon(
//                         deviceProvider.deviceList[index].isOnline),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       )),
// );
