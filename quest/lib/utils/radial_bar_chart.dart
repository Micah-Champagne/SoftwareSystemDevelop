import 'package:flutter/material.dart';
import 'package:quest/utils/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialBarChart extends StatelessWidget {
  const RadialBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: OurColors().cremeColor,
      ),
      child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 175,
                    child: SfRadialGauge(
                      
                      enableLoadingAnimation: true,
                      animationDuration: 3000,
                      axes: [
                        RadialAxis(
                          
                          labelOffset: 0,
                          pointers: [
                            RangePointer(
                              value: 100,
                              cornerStyle: CornerStyle.bothCurve,
                              color: OurColors().professional,
                              width: 30,
                            ),
                          ],
                          axisLineStyle: AxisLineStyle(
                              thickness: 30, color: OurColors().professional),
                          startAngle: 0,
                          endAngle: 0,
                          showLabels: false,
                          showTicks: false,
                          annotations: [
                            GaugeAnnotation(
                              widget: Container(
                                
                                width: 100,
                                child: Text(
                                  "26 Points Earned",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey),
                                ),
                              ),
                              
                            )
                          ],
                        ),
                        RadialAxis(
                          
                          pointers: [
                            RangePointer(
                              value: 45,
                              cornerStyle: CornerStyle.bothCurve,
                              color: OurColors().chores,
                              width: 30,
                            )
                          ],
                          startAngle: 0,
                          endAngle: 0,
                          showLabels: false,
                          showTicks: false,
                          showAxisLine: false,
                        ),
                        RadialAxis(
                          
                          pointers: [
                            RangePointer(
                              value: 40,
                              cornerStyle: CornerStyle.bothCurve,
                              color: OurColors().physical,
                              width: 30,
                            )
                          ],
                          startAngle: 0,
                          endAngle: 0,
                          showLabels: false,
                          showTicks: false,
                          showAxisLine: false,
                        ),
                        RadialAxis(
                          
                          pointers: [
                            RangePointer(
                              value: 40,
                              cornerStyle: CornerStyle.bothCurve,
                              color: OurColors().education,
                              width: 30,
                            )
                          ],
                          axisLineStyle: const AxisLineStyle(thickness: 30),
                          startAngle: 320,
                          endAngle: 320,
                          showLabels: false,
                          showTicks: false,
                          showAxisLine: false,
                        )
                      ],
                    ),
                  ))
                ],
              )
            ],
          )),
    );
  }
}
