import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../model/vibration_model.dart';

class FlChartVibration extends StatelessWidget {
  final List<VibrationModel> vibrationData;
  final double xValue;
  final double yValue;
  final double zValue;

  const FlChartVibration({super.key, required this.vibrationData, required this.xValue, required this.yValue, required this.zValue});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: true),
        lineBarsData: [
          buildLineChartBar(vibrationData.map((data) => data.x ?? xValue).toList(), Colors.red, xValue),
          buildLineChartBar(vibrationData.map((data) => data.y ?? yValue).toList(), Colors.blue, yValue),
          buildLineChartBar(vibrationData.map((data) => data.z ?? zValue).toList(), Colors.orange, zValue),
        ],
        borderData: FlBorderData(
          border: const Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide.none),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            axisNameSize: 20,
            axisNameWidget: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              // child: Text('Value'),
            ),
            sideTitles: SideTitles(
              showTitles: false,
              interval: 3,
              reservedSize: 3,
              getTitlesWidget: leftTitleWidgets,
            ),
          ),
        ),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          horizontalInterval: 1,
          checkToShowHorizontalLine: (double value) {
            return true;
          },
        ),
      ),
    );
  }

  LineChartBarData buildLineChartBar(List<double> data, Color color, double axis) {
    return LineChartBarData(
      spots: data.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
      isCurved: true,
      barWidth: 1.5,
      color: color,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        color: Colors.deepPurple.withOpacity(0.4),
        cutOffY: 10,
        applyCutOffY: false,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 30.0);
    return SideTitleWidget(
      space: 0,
      angle: 0,
      axisSide: meta.axisSide,
      child: Text('$value kerem', style: style),
    );
  }
}
