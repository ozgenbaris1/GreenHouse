import 'package:flutter/material.dart';

class DetailedChartScreen extends StatelessWidget {
  final List<double> dataList;

  DetailedChartScreen({Key key, @required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('abc'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          rows: _convertDataToDataRow(dataList),
          columns: [
            DataColumn(label: Text('Created Date')),
            DataColumn(label: Text('Value'))
          ],
        ),
      ),

      // body: ListView.builder(
      //     itemCount: dataList.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Text('Entry ${dataList[index]}');
      //     }),
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
                DataCell(Text((index + 1).toString())),
                DataCell(Text(data.toString())),
              ],
            ),
          ),
        )
        .values
        .toList();
  }
}
