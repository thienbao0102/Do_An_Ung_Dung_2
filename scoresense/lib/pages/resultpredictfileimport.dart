import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/callbackend.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/predictions.dart';
import 'package:scoresense/module/ui_design.dart';

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
  bool _isLoading = true;
  String search = "";
  int sort = 0;
  List<Predictions> results = List.empty();

  Future<void> _loadData() async {
    results = await sendData(GlobalData().inputDataImport);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
                  const Center(
                    child: Text(
                      "Predict Results",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0062FF)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Total: ${results.length}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Pass: ${results.where((predict) => predict.prediction > 10).toList().length}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Fail: ${results.length - results.where((predict) => predict.prediction > 10).toList().length}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                              startDegreeOffset: 79,
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
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
                              sections: showingSections(
                                  results
                                      .where(
                                          (predict) => predict.prediction > 10)
                                      .toList()
                                      .length,
                                  results.length),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width < 1150
                            ? MediaQuery.of(context).size.width * 0.8
                            : MediaQuery.of(context).size.width * 0.55,
                        margin: const EdgeInsets.only(
                            left: 20, top: 30, bottom: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                spacing: 20,
                                runSpacing: 20,
                                children: [
                                  UiDesign.buildTextField(
                                      "Search",
                                      (value) => setState(() {
                                        search = value;
                                      }),
                                    ),
                                  DropdownMenu(
                                      width: 200,
                                      onSelected: (valueChoose) {
                                        setState(() {
                                          sort = valueChoose!;
                                        });
                                      },
                                      inputDecorationTheme:
                                          const InputDecorationTheme(),
                                      dropdownMenuEntries: const <DropdownMenuEntry<
                                          int>>[
                                        DropdownMenuEntry(value: 0, label: ""),
                                        DropdownMenuEntry(
                                            value: 1, label: "By name a-z"),
                                        DropdownMenuEntry(
                                            value: 2, label: "By name z-a"),
                                        DropdownMenuEntry(
                                            value: 3, label: "By result Pass"),
                                        DropdownMenuEntry(
                                            value: 4, label: "By result Fail"),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(60),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth()
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: const [
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "Name",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "Prediction",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 500,
                              child: SingleChildScrollView(
                                child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: FixedColumnWidth(60),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth()
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    ...renderContentRow(ListSort(results)),
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }

  List<PieChartSectionData> showingSections(int coutPass, int countFull) {
    if (countFull == 0) {
      return [];
    }
    double perPass = ((coutPass / countFull * 100.0) * 10).round() / 10;
    double perFail =
        (((countFull - coutPass) / countFull * 100.0) * 10).round() / 10;

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 85.0 : 60.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 67, 239, 70),
            value: coutPass / countFull * 100.0,
            title: isTouched ? 'Pass' : '${perPass}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFFF95454),
            value: (countFull - coutPass) / countFull * 100.0,
            title: isTouched ? 'Fail' : '${perFail}%',
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

  List<TableRow> renderContentRow(List<Predictions> results) {
    return List<TableRow>.generate(results.length, (int i) {
      return TableRow(children: [
        TableCell(
            child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            "${i}",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
        TableCell(
            child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            "${results[i].name}",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
        TableCell(
            child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            results[i].prediction > 10 ? "Pass" : "Fail",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
      ]);
    });
  }

  //sort data
  List<Predictions> ListSort(List<Predictions> results) {
    List<Predictions> listSort = results
        .where((predict) => predict.name.toLowerCase().contains(search))
        .toList();
    if (sort == 1) {
      listSort = results
          .where((predict) => predict.name.toLowerCase().contains(search))
          .toList()
        ..sort(
          (a, b) {
            // So sánh theo tên từ A-Z
            int nameComparison = a.name.compareTo(b.name);
            if (nameComparison != 0) {
              return nameComparison;
            }
            // Nếu tên giống nhau, sắp xếp theo prediction từ cao đến thấp
            return a.prediction.compareTo(b.prediction);
          },
        );
    } else if (sort == 2) {
      listSort = results
          .where((predict) => predict.name.toLowerCase().contains(search))
          .toList()
        ..sort(
          (a, b) {
            // So sánh theo tên từ Z-A
            int nameComparison = b.name.compareTo(a.name);
            if (nameComparison != 0) {
              return nameComparison;
            }
            // Nếu tên giống nhau, sắp xếp theo prediction từ cao đến thấp
            return a.prediction.compareTo(b.prediction);
          },
        );
    } else if (sort == 3) {
      listSort = results
          .where((predict) =>
              predict.name.toLowerCase().contains(search) &&
              predict.prediction > 10)
          .toList();
    } else if (sort == 4) {
      listSort = results
          .where((predict) =>
              predict.name.toLowerCase().contains(search) &&
              predict.prediction <= 10)
          .toList();
    }
    return listSort;
  }
}
