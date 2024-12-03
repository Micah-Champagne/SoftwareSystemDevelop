import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryBarChart extends StatelessWidget {
  const HistoryBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                enableAxisAnimation: false,
                plotAreaBackgroundColor: Colors.transparent,
                margin: const EdgeInsets.all(10),
                borderColor: Colors.transparent,
                borderWidth: 0,
                plotAreaBorderWidth: 0,
                enableSideBySideSeriesPlacement: false,
                primaryXAxis: const CategoryAxis(
                  labelStyle: TextStyle(color: Colors.black),
                  axisLine: AxisLine(width: 0),
                ),
                primaryYAxis: const NumericAxis(
                  isVisible: false,
                  labelStyle: TextStyle(color: Colors.white),
                  axisLine: AxisLine(width: 0),
                  minimum: 0,
                  maximum: 20,
                  interval: 2,
                ),
                series: <CartesianSeries>[
                  ColumnSeries<ChartColumnData, String>(
                    borderRadius: BorderRadius.circular(10),
                    dataSource: chartData,
                    width: 0.4,
                    color: OurColors().chores,
                    xValueMapper: (ChartColumnData data, _) => data.month,
                    yValueMapper: (ChartColumnData data, _) => data.chores,
                    animationDuration: 1000,
                  ),
                  ColumnSeries<ChartColumnData, String>(
                      borderRadius: BorderRadius.circular(10),
                      dataSource: chartData,
                      width: 0.4,
                      color: OurColors().physical,
                      xValueMapper: (ChartColumnData data, _) => data.month,
                      yValueMapper: (ChartColumnData data, _) => data.physical,
                      animationDuration: 1000),
                  ColumnSeries<ChartColumnData, String>(
                      borderRadius: BorderRadius.circular(10),
                      dataSource: chartData,
                      width: 0.4,
                      color: OurColors().education,
                      xValueMapper: (ChartColumnData data, _) => data.month,
                      yValueMapper: (ChartColumnData data, _) =>
                          data.educational,
                      animationDuration: 1000),
                  ColumnSeries<ChartColumnData, String>(
                      borderRadius: BorderRadius.circular(10),
                      dataSource: chartData,
                      width: 0.4,
                      color: OurColors().professional,
                      xValueMapper: (ChartColumnData data, _) => data.month,
                      yValueMapper: (ChartColumnData data, _) =>
                          data.professional,
                      animationDuration: 1000),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            color: OurColors().chores,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Chores',
                            style: GoogleFonts.lato(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 2),
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            color: OurColors().education,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Educational',
                            style: GoogleFonts.lato(color: Colors.black)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            color: OurColors().physical,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Physical',
                            style: GoogleFonts.lato(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            color: OurColors().professional,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Professional',
                            style: GoogleFonts.lato(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class ChartColumnData {
  ChartColumnData(this.month, this.chores, this.physical, this.educational,
      this.professional);
  final String month;
  final int chores;
  final int physical;
  final int educational;
  final int professional;
}

final List<ChartColumnData> chartData = [
  ChartColumnData('Jul', 20, 18, 7, 2),
  ChartColumnData('Aug', 20, 15, 8, 2),
  ChartColumnData('Sept', 20, 15, 10, 3),
  ChartColumnData('Oct', 20, 16, 14, 5),
  ChartColumnData('Nov', 20, 18, 16, 13),
  ChartColumnData('Dec', 20, 18, 16, 9),
];
