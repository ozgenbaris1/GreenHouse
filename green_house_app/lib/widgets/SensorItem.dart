// import 'package:baykus_mobile_demo/models/arrow_type.dart';
// import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:green_house_app/models/ArrowType.dart';
import 'package:green_house_app/helper/Colors.dart';

// import '../helper.dart';

class SensorItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final ArrowType arrowType;
  // final BoxTypes boxType;
  final Border border;

  const SensorItem(
      {@required this.icon,
      @required this.title,
      @required this.value,
      // @required this.boxType,
      this.border,
      this.arrowType});

  Widget _buildArrow() {
    if (arrowType == ArrowType.equals) {
      return Icon(Icons.maximize);
    } else if (arrowType == ArrowType.up) {
      return Icon(Icons.arrow_drop_up);
    } else if (arrowType == ArrowType.down) {
      return Icon(Icons.arrow_drop_down);
    } else {
      return Icon(Icons.maximize);
    }
  }

  @override
  Widget build(BuildContext context) {
    var color;

    if (title == 'Temperature') {
      color = MyColors.temperatureColor;
    } else if (title == 'Humidity') {
      color = MyColors.humidityColor;
    } else {
      color = MyColors.smokeColor;
    }

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color, //Helper.getBoxColor(boxType)[0],
          border: border,
          borderRadius: BorderRadius.circular(5)),
      width: 100,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildArrow(),
          SizedBox(
            height: 10,
          ),
          Text(value == null ? "" : value, style: TextStyle(fontSize: 15)),
          SizedBox(
            height: 15,
          ),
          // Container(
          //   height: 30,
          //   child: SvgPicture.asset('/assets/icons/$icon.svg'),
          // ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
