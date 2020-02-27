import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:green_house_app/helper/Colors.dart';
import '../models/SensorData.dart';

class ChartDetailScreen extends StatelessWidget {
  final List<SensorData> sensorData;
  final Widget child;

  const ChartDetailScreen({
    Key key,
    this.sensorData,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backgroundColor,
      child: Dismissible(
        direction: DismissDirection.down,
        key: Key('key'),
        onDismissed: (_) => Navigator.of(context).pop(),
        child: Material(
          child: Container(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    child,
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(30),
                      child: IconButton(
                        color: Colors.grey,
                        icon: Icon(Icons.cancel),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      headingRowHeight: 45,
                      horizontalMargin: 10,
                      rows: _convertDataToDataRow(),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Created Date',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Value',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> _convertDataToDataRow() {
    return sensorData
        .map(
          (item) => DataRow(
            cells: [
              DataCell(
                Text(item.createdDate),
              ),
              DataCell(
                Text(item.value.toString()),
              ),
            ],
          ),
        )
        .toList();
  }
}
