import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:green_house_app/helper/Colors.dart';

class ChartItem extends StatelessWidget {
  final String metricName;
  final double value;
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
                    data: dataList
                        .take(5)
                        .toList()
                        .reversed
                        .toList(), // Show Last 5 values
                    lineWidth: 3.0,
                    pointColor: Colors.black,
                    pointSize: 8.0,
                    pointsMode: PointsMode.all,
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

// LineChart(
//                     LineChartData(
//                       gridData: FlGridData(
//                         show: true,
//                         drawVerticalLine: true,
//                         getDrawingHorizontalLine: (value) {
//                           return const FlLine(
//                             color: Color(0xff37434d),
//                             strokeWidth: 1,
//                           );
//                         },
//                         getDrawingVerticalLine: (value) {
//                           return const FlLine(
//                             color: Color(0xff37434d),
//                             strokeWidth: 1,
//                           );
//                         },
//                       ),
//                       titlesData: FlTitlesData(
//                         show: true,
//                         bottomTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 22,
//                           textStyle: TextStyle(
//                               color: const Color(0xff68737d),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16),
//                           getTitles: (value) {
//                             switch (value.toInt()) {
//                               case 2:
//                                 return 'MAR';
//                               case 5:
//                                 return 'JUN';
//                               case 8:
//                                 return 'SEP';
//                             }
//                             return '';
//                           },
//                           margin: 8,
//                         ),
//                         leftTitles: SideTitles(
//                           showTitles: true,
//                           textStyle: TextStyle(
//                             color: const Color(0xff67727d),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                           getTitles: (value) {
//                             switch (value.toInt()) {
//                               case 1:
//                                 return '10k';
//                               case 3:
//                                 return '30k';
//                               case 5:
//                                 return '50k';
//                             }
//                             return '';
//                           },
//                           reservedSize: 28,
//                           margin: 12,
//                         ),
//                       ),
//                       borderData: FlBorderData(
//                           show: true,
//                           border: Border.all(
//                               color: const Color(0xff37434d), width: 1)),
//                       minX: 0,
//                       maxX: 11,
//                       minY: 0,
//                       maxY: 6,
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: const [
//                             FlSpot(0, 3),
//                             FlSpot(2.6, 2),
//                             FlSpot(4.9, 5),
//                             FlSpot(6.8, 3.1),
//                             FlSpot(8, 4),
//                             FlSpot(9.5, 3),
//                             FlSpot(11, 4),
//                           ],
//                           isCurved: true,
//                           colors: [Colors.blue, Colors.red],
//                           barWidth: 5,
//                           isStrokeCapRound: true,
//                           dotData: const FlDotData(
//                             show: false,
//                           ),
//                           belowBarData: BarAreaData(
//                             show: true,
//                             colors: [Colors.blue, Colors.red]
//                                 .map((color) => color.withOpacity(0.3))
//                                 .toList(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
