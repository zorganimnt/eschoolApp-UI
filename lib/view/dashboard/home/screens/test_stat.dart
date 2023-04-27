import 'package:eschoolapp/view/dashboard/home/screens/indicator.dart';

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
          Text("Utilisateur de Eschoolapp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 8,),  
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: AspectRatio(
              aspectRatio: 4,
              child: Column(
                children: <Widget>[
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Indicator(
                        color: Colors.blue,
                        text: 'Apprenant',
                        isSquare: false,
                        size: touchedIndex == 0 ? 18 : 16,
                        textColor: touchedIndex == 0 ? Colors.red : Colors.blue,
                      ),
                      Indicator(
                        color: Colors.yellow,
                        text: 'Parent',
                        isSquare: false,
                        size: touchedIndex == 1 ? 18 : 16,
                        textColor: touchedIndex == 1 ? Colors.red : Colors.blue,
                      ),
                      Indicator(
                        color: Colors.pink,
                        text: 'Fomateur',
                        isSquare: false,
                        size: touchedIndex == 2 ? 18 : 16,
                        textColor: touchedIndex == 2 ? Colors.red : Colors.blue,
                      ),
                      Indicator(
                        color: Colors.black,
                        text: 'Emplyer',
                        isSquare: false,
                        size: touchedIndex == 3 ? 18 : 16,
                        textColor: touchedIndex == 3 ? Colors.red : Colors.blue,
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
        const color0 = Colors.blue;
        const color1 = Colors.yellow;
        const color2 = Colors.red;
        const color3 = Colors.green;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 25,
              title: '',
              radius: 80,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: Colors.blue.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 25,
              title: '',
              radius: 65,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: Colors.blue.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 25,
              title: '',
              radius: 60,
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: Colors.blue.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 25,
              title: '',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.black, width: 6)
                  : BorderSide(color: Colors.blue.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
