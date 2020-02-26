import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/helper/Colors.dart';

class NavigationBarWidget extends StatefulWidget {
  @override
  _NavigationBarWidget createState() => _NavigationBarWidget();
}

class _NavigationBarWidget extends State<NavigationBarWidget> {
  var currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return CircleBottomNavigation(
      barBackgroundColor: MyColors.navigationBarBarBackgroundColor,
      inactiveIconColor: MyColors.navigationBarInactiveIconColor,
      activeIconColor: MyColors.navigationBarActiveIconColor,
      circleColor: MyColors.navigationBarCircleColor,
      textColor: MyColors.navigationBarTextColor,
      initialSelection: currentPage,
      tabs: [
        TabData(
          title: 'Chart',
          icon: Icons.show_chart,
        ),

        TabData(
          title: 'Edit',
          icon: Icons.edit,
        ),
        TabData(
          title: 'Home',
          icon: Icons.home,
        ),
        TabData(
          title: 'Attributes',
          icon: Icons.edit_attributes,
        ),
        TabData(
          title: 'Settings',
          icon: Icons.settings,
        ),
        // TabData(
        //   title: 'Table Chart',
        //   icon: Icons.table_chart,
        // ),
      ],
      onTabChangedListener: (index) => setState(() => currentPage = index),
    );
  }
}
