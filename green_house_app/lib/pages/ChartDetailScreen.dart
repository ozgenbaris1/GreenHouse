import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:green_house_app/helper/Colors.dart';

class ChartDetailScreen extends StatelessWidget {
  final List<double> data;
  final Widget child;

  const ChartDetailScreen({
    Key key,
    this.data,
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
                      rows: _convertDataToDataRow(data),
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

  List<DataRow> _convertDataToDataRow(List<double> list) {
    return list
        .asMap()
        .map(
          (index, data) => MapEntry(
            index,
            DataRow(
              cells: [
                DataCell(Text('25.02.2020 19:51')),
                DataCell(Text(data.toString())),
              ],
            ),
          ),
        )
        .values
        .toList();
  }
}
