import 'package:flutter/material.dart';
import 'package:quest/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineChart1 extends StatefulWidget {
  const SplineChart1({super.key});

  @override
  _SplineChart1State createState() => _SplineChart1State();
}

class _SplineChart1State extends State<SplineChart1> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(0, 0, 0, 0),
      ChartData(4, 4, 6, 6),
      ChartData(8, 4, null, null),
      ChartData(12, 10, null, null),
      ChartData(16, 8, null, null),
      ChartData(20, 7, null, null),
      ChartData(24, 4, null, null),
      ChartData(28, 3, null, null),
    ];

    return SizedBox(
      height: 190,
      width: 400,
      child: SfCartesianChart(
        primaryXAxis: const NumericAxis(
          title: AxisTitle(text: 'Day of Month'),
          interval: 7,
          labelFormat: '{value}',
          isVisible: true,
        ),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Points Gained'),
          interval: 2,
          maximum: 11,
        ),
        series: <CartesianSeries>[
          SplineSeries<ChartData, int>(
            width: 10,
            color: const Color(0xff7C678A),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,
            animationDuration: 2000,
          ),
          SplineSeries<ChartData, int>(
            width: 10,
            color: const Color(0xff838EF4),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2,
            animationDuration: 9000,
          ),
          SplineSeries<ChartData, int>(
            width: 18,
            color: const Color(0x99838EF4),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y3,
            animationDuration: 9000,
          ),
          ScatterSeries<ChartData, int>(
            dataSource: chartData.where((data) => data.x == 4).toList(),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2 ?? 0,
            markerSettings: MarkerSettings(
              borderColor: Colors.white,
              borderWidth: 3,
              isVisible: true,
              shape: DataMarkerType.circle,
              width: 10,
              height: 10,
              color: Color(0xff838EF4),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);
  final int x;
  final double? y1;
  final double? y2;
  final double? y3;
}
