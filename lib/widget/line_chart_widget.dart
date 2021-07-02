import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_multiplier/utils/app_colors_utils.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> lineColor = [
    AppColorsUtils.lineColorUtils,
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          rangeAnnotations: RangeAnnotations(),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              dotData: FlDotData(show: false),
              colors: lineColor,
            )
          ],
        ),
      );
}
