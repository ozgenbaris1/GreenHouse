import 'package:flutter/material.dart';
import 'package:green_house_app/helper/Colors.dart';

class DeviceItem extends StatelessWidget {
  final String name;
  final int isOnline;

  DeviceItem({Key key, @required this.name, @required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12.0),
          // shadowColor: Colors.white,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                color: MyColors.headerTextColor, fontSize: 15),
                          ),
                          Text("$name $isOnline",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24.0)),
                        ],
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Widget child, {Function() onTap}) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12.0),
          // shadowColor: Colors.white,
          child: InkWell(
            child: child,
          ),
        ),
      ),
    );
  }
}
