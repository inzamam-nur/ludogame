import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'gameover.dart';
import 'controller/play_controller.dart';
import 'home.dart';

class BarChart extends GetView<PlayController> {
  const BarChart({Key? key});

  Color getColorForValue(int value) {
    switch (value) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.yellow;
      default:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> incrementedValues = controller.allArrayList.map((item) => (item + 1) as int).toList();

    List<_SalesData> data = incrementedValues.map((item) => _SalesData(item, item)).toList();

    List<int> lastTwelveValues = incrementedValues.length > 12
        ? incrementedValues.sublist(incrementedValues.length - 12)
        : incrementedValues;

    List<_SalesData> lastTwelveData = lastTwelveValues
        .asMap()
        .map((index, value) => MapEntry(index + 1, _SalesData(index + 1, value)))
        .values
        .toList();

    List<_SalesData> combinedData = [];
    for (int i = 0; i < lastTwelveData.length; i += 2) {
      if (i + 1 < lastTwelveData.length) {
        int xValue = lastTwelveData[i].xValue;
        int yValue = lastTwelveData[i].yValue + lastTwelveData[i + 1].yValue;
        combinedData.add(_SalesData(xValue, yValue));
      } else {
        combinedData.add(lastTwelveData[i]);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Existing UI code...
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Existing UI code...
                Text('Last 12 Values: ${lastTwelveValues.join(', ')}'), // Display the last 12 values
              ],
            ),
            SizedBox(
              height: 400,
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(),
                series: <ChartSeries<_SalesData, int>>[
                  ColumnSeries<_SalesData, int>(
                    dataSource: combinedData,
                    xValueMapper: (_SalesData sales, _) => sales.xValue,
                    yValueMapper: (_SalesData sales, _) => sales.yValue,
                    pointColorMapper: (sales, _) => getColorForValue(sales.xValue),
                  ),
                ],
              ),
            ),
            // Existing UI code...
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.xValue, this.yValue);

  final int xValue;
  final int yValue;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bar Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarChart(),
    );
  }
}
