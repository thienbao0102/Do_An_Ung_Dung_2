import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/header.dart';

class Resultpredictfileimport extends StatelessWidget {
  const Resultpredictfileimport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Background_OtherPage.png'),
              fit: BoxFit.cover)),
      child: const ShowResult(),
    ));
  }
}

class ShowResult extends StatefulWidget {
  const ShowResult({super.key});

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 140, bottom: 50),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Predict Results",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 70,
                  children: [
                    SizedBox(
                      height: 0,
                      width: 0,
                    ),
                    Text(
                      "Count: 400",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Pass: 350",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Fail: 50",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      height: 350,
                      width: 350,
                      child: Center(
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
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
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 4,
                            centerSpaceRadius: 90,
                            sections: showingSections(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 1150
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.55,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 40),
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(60),
                          1: FlexColumnWidth(),
                          2: FlexColumnWidth()
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: const [
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "Percent-Pass",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "Predicted",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                          ]),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Positioned(
          top: 40,
          left: 120,
          child: Header(),
        ),
      ],
    ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 85.0 : 60.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xFF77CDFF),
            value: 87.5,
            title: isTouched ? 'Pass' : '87.5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xFFF95454),
            value: 12.5,
            title: isTouched ? 'Fail' : '12.5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
