import 'package:eschoolapp/view/dashboard/home/widgets/indicator.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Les niveuax scolaire de Eschoolapp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 8,),  
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: AspectRatio(
              aspectRatio: 2,
              child: Column(
                children: <Widget>[
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Indicator(
                        color: Colors.blue,
                        text: 'Primaire',
                        isSquare: false,
                        size: touchedIndex == 0 ? 20 : 16,
                        textColor: touchedIndex == 0 ? Colors.black54 : Colors.blue,
                      ),
                      Indicator(
                        color: Colors.yellow,
                        text: 'Secondaire',
                        isSquare: false,
                        size: touchedIndex == 1 ? 20 : 16,
                        textColor: touchedIndex == 1 ? Colors.black54 : Colors.yellow,
                      ),
                      Indicator(
                        color: Colors.pink,
                        text: 'avec bac',
                        isSquare: false,
                        size: touchedIndex == 2 ? 20 : 16,
                        textColor: touchedIndex == 2 ? Colors.black54 : Colors.pink,
                      ),
                      Indicator(
                        color: Colors.green,
                        text: 'Bac +',
                        isSquare: false,
                        size: touchedIndex == 3 ? 20 : 16,
                        textColor: touchedIndex == 3 ? Colors.black54 : Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          startDegreeOffset: 180,
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 1,
                          centerSpaceRadius: 0,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        const color0 = Colors.blueAccent;
        const color1 = Colors.yellow;
        const color2 = Colors.redAccent;
        const color3 = Colors.green;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 10,
              title: '10%',
              radius: 120,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 5)
                  : BorderSide(color: Colors.black),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 30,
              title: '30%',
              radius: 105,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 5)
                  : BorderSide(color: Colors.black),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 40,
              title: '40%',
              radius: 100,
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 5)
                  : BorderSide(color: Colors.black),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 20,
              title: '20%',
              radius: 110,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 5)
                  : BorderSide(color: Colors.black),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
