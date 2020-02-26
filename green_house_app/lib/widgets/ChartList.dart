import 'package:flutter/material.dart';
import 'package:green_house_app/models/ChartData.dart';
import 'package:green_house_app/pages/ChartDetailScreen.dart';
import 'package:green_house_app/widgets/ChartItem.dart';

class ChartList extends StatelessWidget {
  final List<ChartData> chartData;

  const ChartList({@required this.chartData});

  @override
  Widget build(BuildContext context) {
    // List<double> doubleList = chartData.map((item) => item.sensorData)

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: chartData
            .map<Widget>(
              (item) => FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return ChartDetailScreen(
                          sensorData: item.sensorData,
                          child: ChartItem(
                            metric: item.sensor.unitSymbol,
                            value: item.sensorData[0].value,
                            dataList: item.sensorData
                                .map<double>((item) => item.value)
                                .toList(),
                            metricName: item.sensor.name,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: ChartItem(
                  metricName: item.sensor.name,
                  metric: item.sensor.unitSymbol,
                  value: item.sensorData[0].value,
                  dataList: item.sensorData
                      .map<double>((item) => item.value)
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
