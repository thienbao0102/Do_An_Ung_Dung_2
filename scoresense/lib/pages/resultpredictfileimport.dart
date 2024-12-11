import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/callbackend.dart';
import 'package:scoresense/module/data_detail_table.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/predictions.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/detailed_page.dart';
import 'package:scoresense/pages/predictformdata.dart';
import 'package:scoresense/pages/predictimportfile.dart';

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
  List<List<String>> dataInput = List.empty();

  Future<void> _loadData() async {
    results = await sendData(GlobalData().inputDataImport,GlobalData().version);
    addResultToDataInput();
    setState(() {
      _isLoading = false;
    });
  }

  void addResultToDataInput() {
    List<List<String>> result = results.map((prediction) {
      return [prediction.name, prediction.prediction.toString()];
    }).toList();
    dataInput = GlobalData().inputDataImport.map((innerList) {
      return innerList.map((e) => e.toString()).toList();
    }).toList();
    dataInput.removeAt(0);  // Xóa dòng header của dataInput
    // Kiểm tra kích thước của dataInput và result
    if (dataInput.length == result.length) {
      for (int i = 0; i < dataInput.length; i++) {
        dataInput[i].insert(0, (i + 1).toString());
        if(int.parse(result[i][1]) > 10) {
          dataInput[i].add( "Pass");// Thêm giá trị vào cuối mỗi dòng của dataInput
        } else {
          dataInput[i].add( "Fail");
        }
      }
    } else {
      for (int i = 0; i < dataInput.length; i++) {
        dataInput[i].insert(0, (i + 1).toString());
        dataInput[i].add("N/A");  // Thêm giá trị vào cuối mỗi dòng của dataInput
      }
    }
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(
            setColor: GlobalData().colorPrimary,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
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
                      const SizedBox(
                        width: 50,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ImportFilePredict()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFF8FD14F)),
                            child: const Row(
                              children: [
                                Icon(Icons.upload_file, size: 24),
                                SizedBox(width: 8),
                                Text(
                                  "Other File",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailedPage( data: dataInput,)),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 160, 233, 255)),
                            child: const Row(
                              children: [
                                Icon(Icons.add, size: 24),
                                SizedBox(width: 8),
                                Text(
                                  "See Detail",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
                        margin: const EdgeInsets.only(left: 20, bottom: 20),
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
                                    "",
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
                                    initialSelection: 0,
                                    inputDecorationTheme:
                                        const InputDecorationTheme(),
                                    dropdownMenuEntries: const <DropdownMenuEntry<
                                        int>>[
                                      DropdownMenuEntry(
                                          value: 0, label: "By name a-z"),
                                      DropdownMenuEntry(
                                          value: 1, label: "By name z-a"),
                                      DropdownMenuEntry(
                                          value: 2, label: "By result Pass"),
                                      DropdownMenuEntry(
                                          value: 3, label: "By result Fail"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                              height: 380,
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
            "${i + 1}",
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
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() {});
              },
              onExit: (_) {
                setState(() {});
              },
              child: GestureDetector(
                onTap: () {
                  viewDetail(results[i].originalIndex);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterFormData()),
                  );
                },
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            results[i].prediction > 10 ? "Pass" : "Fail",
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]);
    });
  }

  //sort data
  List<Predictions> ListSort(List<Predictions> results) {
    List<Predictions> listSort;
    if (sort == 0) {
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
    } else if (sort == 1) {
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
    } else if (sort == 2) {
      listSort = results
          .where((predict) =>
              predict.name.toLowerCase().contains(search) &&
              predict.prediction > 10)
          .toList();
    } else {
      listSort = results
          .where((predict) =>
              predict.name.toLowerCase().contains(search) &&
              predict.prediction <= 10)
          .toList();
    }
    return listSort;
  }
}

//get object want to view detail predicttion
void viewDetail(int indexObject) {
  List<dynamic> row = GlobalData().inputDataImport[indexObject + 1];
  GlobalData().firstName = row[0];
  GlobalData().lastName = " ";
  GlobalData().school = row[1];
  GlobalData().gender = row[2] == "M" ? "Male" : "Female";
  GlobalData().age = row[3];
  GlobalData().location = row[4] == "U" ? "Urban" : "Rural";
  GlobalData().familySize =
      row[5] == "LS3" ? "Less than or equal to 3" : "Greater than 3";
  GlobalData().parentStatus = row[6] == "A" ? "Apart" : "Together";
  GlobalData().motherEducation = row[7];
  GlobalData().fatherEducation = row[8];
  GlobalData().motherJob = capitalizeFirstLetter(row[9]);
  GlobalData().fatherJob = capitalizeFirstLetter(row[10]);
  GlobalData().reason = capitalizeFirstLetter(row[11]);
  GlobalData().guardian = capitalizeFirstLetter(row[12]);
  GlobalData().travelTimeIndex = row[13] - 1;
  GlobalData().weeklyStudyTime = row[14] - 1;
  GlobalData().numOfFailClass = row[15];
  GlobalData().schoolSupport = capitalizeFirstLetter(row[16]);
  GlobalData().familySupport = capitalizeFirstLetter(row[17]);
  GlobalData().paidClasses = capitalizeFirstLetter(row[18]);
  GlobalData().extracurricularActivities = capitalizeFirstLetter(row[19]);
  GlobalData().nurserySchool = capitalizeFirstLetter(row[20]);
  GlobalData().higherEducation = capitalizeFirstLetter(row[21]);
  GlobalData().internetAtHome = capitalizeFirstLetter(row[22]);
  GlobalData().relationship = capitalizeFirstLetter(row[23]);
  GlobalData().familyQuality = row[24] - 1;
  GlobalData().freeTimeIndex = row[25] - 1;
  GlobalData().goOutIndex = row[26] - 1;
  GlobalData().workdayAlcohol = row[27] - 1;
  GlobalData().weekendAlcohol = row[28] - 1;
  GlobalData().currentHealth = row[29] - 1;
  GlobalData().absences = row[30];
  GlobalData().G1 = row[31];
  GlobalData().G2 = row[32];
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input; // Nếu chuỗi rỗng, trả về chuỗi gốc
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}
