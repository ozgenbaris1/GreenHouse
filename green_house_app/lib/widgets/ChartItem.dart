import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:green_house_app/helper/Colors.dart';
import 'package:green_house_app/pages/ChartDetailScreen.dart';

class ChartItem extends StatelessWidget {
  final String metricName;
  final num value;
  final String metric;
  final List<double> dataList;

  ChartItem(
      {Key key,
      @required this.metricName,
      @required this.value,
      @required this.metric,
      @required this.dataList})
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
                            metricName,
                            style: TextStyle(
                                color: MyColors.headerTextColor, fontSize: 15),
                          ),
                          Text("$value $metric",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24.0)),
                        ],
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline(
                    data: dataList,
                    lineWidth: 3.0,
                    pointColor: Colors.black,
                    pointSize: 8.0,
                    pointsMode: PointsMode.last,
                    lineColor: MyColors.headerTextColor,
                  )
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
