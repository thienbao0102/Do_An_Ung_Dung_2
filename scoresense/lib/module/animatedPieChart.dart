import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  final String title;
  final double maximumValue;
  final ChartSampleData data; // Change to a single data point
  final bool tooltipEnabled;

  // Constructor to initialize the chart parameters
  RadialBarChart({
    required this.title,
    required this.maximumValue,
    required this.data,
    this.tooltipEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      key: GlobalKey(),
      title: ChartTitle(text: title),
      series: _getRadialBarDefaultSeries(),
      tooltipBehavior: TooltipBehavior(enable: tooltipEnabled),
    );
  }

  /// Returns radial series based on the given data point and maximum value.
  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    bool isPerfectScore = data.y == maximumValue;
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        maximumValue: maximumValue,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(fontSize: 10.0),
        ),
        dataSource: [data], // Use the single data point
        
        cornerStyle: isPerfectScore ? CornerStyle.bothFlat : CornerStyle.bothCurve, // Thay đổi cornerStyle dựa trên giá trị
        gap: '85%',
        radius: '180%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y ,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        dataLabelMapper: (ChartSampleData data, _) => data.x as String,
      ),
    ];
  }
}

/// Class to hold chart data
class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.y,
    this.text,
    this.pointColor,
  });

  final String x;
  final double y;
  final String? text;
  final Color? pointColor;
}

