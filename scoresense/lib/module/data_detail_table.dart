import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoresense/module/global_variable.dart';

class CustomTable extends StatefulWidget {
  final List<List<String>> data;

  const CustomTable({super.key, required this.data});
  @override
  // ignore: library_private_types_in_public_api
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController1 = ScrollController();
  final ScrollController _verticalScrollController2 = ScrollController();
  List<List<String>>? printData;
  int numOfRow = 0;
  int numOfRow2 = 0;
  final Map<int, int> _sortButtonDegrees = {};

  @override
  void dispose() {
    // Đừng quên hủy bỏ ScrollController khi không còn sử dụng
    _verticalScrollController1.dispose();
    _verticalScrollController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    printData = widget.data;//Khoi tao mang chua gia tri in len bang

    // Lắng nghe scroll của controller1 và gán cho controller2
    _verticalScrollController1.addListener(() {
      if (_verticalScrollController1.position.hasPixels &&
          _verticalScrollController1.position.pixels != _verticalScrollController2.position.pixels &&
          _verticalScrollController2.hasClients) {
        _verticalScrollController2.jumpTo(_verticalScrollController1.position.pixels);
      }
    });

    // Lắng nghe scroll của controller2 và gán cho controller1
    _verticalScrollController2.addListener(() {
      if (_verticalScrollController2.position.hasPixels &&
          _verticalScrollController2.position.pixels != _verticalScrollController1.position.pixels &&
          _verticalScrollController1.hasClients) {
        _verticalScrollController1.jumpTo(_verticalScrollController2.position.pixels);
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 0, left: 16, top: 16, bottom: 16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(const Color.fromARGB(118, 0, 98, 255)), // Màu của thanh cuộn
                  radius: const Radius.circular(10), // Bo tròn các góc của thanh cuộn
                  thickness: WidgetStateProperty.all(6), // Độ dày của thanh cuộn
                  minThumbLength: 50, // Độ dài tối thiểu của thanh cuộn
                ),
                child: Scrollbar(
                  controller: _verticalScrollController1,
                  thumbVisibility: false,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: _verticalScrollController1, // Gán ScrollController vào SingleChildScrollView
                    scrollDirection: Axis.vertical, // Cuộn dọc
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(75), // Cột đầu tiên có độ rộng cố định
                        1: IntrinsicColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(0), bottomLeft: Radius.circular(0)),
                              ),
                              child: _buildHeader("No", 1),
                            ),
                            
                            _buildHeader("Name", 2),
                          ],
                        ),
                        const TableRow(
                          children: [
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                          ],
                        ),
                        for (int i = 0; i < printData!.length; i++)
                          _buildFixedRow(printData![i][0], printData![i][1], numOfRow++),
                      ],
                    )
                  ),
                ),
              ),
              Expanded( // Sử dụng Expanded để chiếm phần không gian còn lại
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(const Color.fromARGB(118, 0, 98, 255)), // Màu của thanh cuộn
                  radius: const Radius.circular(10), // Bo tròn các góc của thanh cuộn
                  thickness: WidgetStateProperty.all(6), // Độ dày của thanh cuộn
                  minThumbLength: 50, // Độ dài tối thiểu của thanh cuộn
                ), 
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _horizontalScrollController, // Gán ScrollController vào Scrollbar
                  child: SingleChildScrollView(
                    controller: _horizontalScrollController, // Gán ScrollController vào SingleChildScrollView
                    scrollDirection: Axis.horizontal, // Cuộn ngang
                    child: 
                        Scrollbar(
                          thumbVisibility: false,
                          controller: _verticalScrollController2,
                          child: SingleChildScrollView(
                          scrollDirection: Axis.vertical, // Cuộn dọc
                          physics: const BouncingScrollPhysics(),
                          controller: _verticalScrollController2, // Gán ScrollController vào SingleChildScrollView
                          child: Row(
                            children: [
                              Table(
                                columnWidths: {
                                  for (int i = 0; i < 33; i++) i: const FixedColumnWidth(150),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                        _buildHeader("School", 3),
                                        _buildHeader("Sex", 4),
                                        _buildHeader("Age", 5),
                                        _buildHeader("Address", 6),
                                        _buildHeader("Famsize", 7),
                                        _buildHeader("Pstatus", 8),
                                        _buildHeader("Medu", 9),
                                        _buildHeader("Fedu", 10),
                                        _buildHeader("Mjob", 11),
                                        _buildHeader("Fjob", 12),
                                        _buildHeader("Reason", 13),
                                        _buildHeader("Guardian", 14),
                                        _buildHeader("Travel Time", 15),
                                        _buildHeader("Study Time", 16),
                                        _buildHeader("Failures", 17),
                                        _buildHeader("School Sup", 18),
                                        _buildHeader("Fam Sup", 19),
                                        _buildHeader("Paid", 20),
                                        _buildHeader("Activities", 21),
                                        _buildHeader("Nursery", 22),
                                        _buildHeader("Higher", 23),
                                        _buildHeader("Internet", 24),
                                        _buildHeader("Romantic", 25),
                                        _buildHeader("Famrel", 26),
                                        _buildHeader("Free Time", 27),
                                        _buildHeader("Go Out", 28),
                                        _buildHeader("Dalc", 29),
                                        _buildHeader("Walc", 30),
                                        _buildHeader("Health", 31),
                                        _buildHeader("Absences", 32),
                                        _buildHeader("G1", 33),
                                        _buildHeader("G2", 34),
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
                                          ),
                                          child: _buildHeader("Result", 35),
                                        ),
                                        const SizedBox(width: 16,),                                  
                                      ],
                                    ),
                                    const TableRow(
                                      children: [
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                    
                                    for (int i = 0; i < printData!.length; i++)
                                      _buildRow(printData![i][0], printData![i][1], printData![i][2], printData![i][3], printData![i][4], printData![i][5], printData![i][6], printData![i][7], printData![i][8], printData![i][9], printData![i][10], printData![i][11], printData![i][12], printData![i][13], printData![i][14], printData![i][15], printData![i][16], printData![i][17], printData![i][18], printData![i][19], printData![i][20], printData![i][21], printData![i][22], printData![i][23], printData![i][24], printData![i][25], printData![i][26], printData![i][27], printData![i][28], printData![i][29], printData![i][30], printData![i][31], printData![i][32], printData![i][33], printData![i][34], numOfRow2++)
                                ],
                              ),
                              const SizedBox(width: 16),
                            ],
                          )
                        ),
                      )
                    ),
                  )
                )
              )
            ]
          ),
        ],
      )
    );
  }

  Widget _buildHeader(String text, int buttonId) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Cập nhật giá trị trong setState
          setState(() {
            numOfRow = 0;
            numOfRow2 = 0;
            if(_sortButtonDegrees[buttonId] == 0 || _sortButtonDegrees[buttonId] == null){
              _sortButtonDegrees[buttonId] = 180;
              printData = sortData(printData!, buttonId, true);
            } else {
              printData = sortData(printData!, buttonId, false);
              _sortButtonDegrees[buttonId] = 0;
            }
            for (int i = 1; i <= 35; i++) {
              if (i != buttonId) {
                _sortButtonDegrees[i] = -1;
              }
            }
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(color: Color.fromARGB(255, 235, 234, 234), width: 1),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: GlobalData().colorPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 5),
              _buildSortButton(_sortButtonDegrees[buttonId]??-1),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a table cell
  Widget _buildCell(String text) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center, // Căn giữa dọc và ngang
      child: Center(
        child: (text == "Pass" || text == "Fail")
        ? Container(
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: text == "Pass" ? const Color.fromARGB(255, 210, 255, 217) : const Color.fromARGB(255, 253, 224, 228),), // Nếu là "Pass" thì màu xanh, ngược lại màu đỏ),
          child: Text(
            text, // Nếu là "Pass" hoặc "Fail", hiển thị text bình thường
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: text == "Pass" ? const Color.fromARGB(255, 3, 176, 43) : const Color.fromARGB(255, 201, 97, 97),
            ),
            textAlign: TextAlign.center,
          ),
        )
        : (text == "yes" || text == "no")
            ? text == "yes"
                ? SvgPicture.asset(
                    "Check.svg", // Hiển thị icon check khi text là "yes"
                    width: 20,
                    height: 20,
                  )
                : SvgPicture.asset(
                    "X.svg", // Hiển thị icon "X" khi text là "no"
                    width: 20,
                    height: 20,
                  )
            : Text(
                text, // Hiển thị text bình thường nếu không phải "yes", "no", "Pass" hoặc "Fail"
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: GlobalData().colorText,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  // Function to build a row of data
  TableRow _buildRow(String no, String name, String school, String sex, String age, String address, String famsize, String pstatus, String medu, String fedu, String mjob, String fjob, String reason, String guardian, String travelTime, String studyTime, String failures, String schoolSup, String famSup, String paid, String activities, String nursery, String higher, String internet, String romantic, String famrel, String freeTime, String goOut, String dalc, String walc, String health, String absences, String g1, String g2, String result, int numOfRow) {
    return TableRow(
      decoration: BoxDecoration(
        color: numOfRow % 2 == 0 ? Colors.white : Colors.lightBlue.shade50, // Dòng lẻ trắng, dòng chẵn xanh nhạt
      ),
      children: [
        // _buildCell(no),
        // _buildCell(name),
        _buildCell(school),
        _buildCell(sex),
        _buildCell(age),
        _buildCell(address),
        _buildCell(famsize),
        _buildCell(pstatus),
        _buildCell(medu),
        _buildCell(fedu),
        _buildCell(mjob),
        _buildCell(fjob),
        _buildCell(reason),
        _buildCell(guardian),
        _buildCell(travelTime),
        _buildCell(studyTime),
        _buildCell(failures),
        _buildCell(schoolSup),
        _buildCell(famSup),
        _buildCell(paid),
        _buildCell(activities),
        _buildCell(nursery),
        _buildCell(higher),
        _buildCell(internet),
        _buildCell(romantic),
        _buildCell(famrel),
        _buildCell(freeTime),
        _buildCell(goOut),
        _buildCell(dalc),
        _buildCell(walc),
        _buildCell(health),
        _buildCell(absences),
        _buildCell(g1),
        _buildCell(g2),
        _buildCell(result),
        const SizedBox(width: 16,)
      ],
    );
  }

  TableRow _buildFixedRow(String no, String name, int numOfRow) {
    return TableRow(
      decoration: BoxDecoration(
        color: numOfRow % 2 == 0 ? Colors.white : Colors.lightBlue.shade50, // Dòng lẻ trắng, dòng chẵn xanh nhạt
      ),
      children: [
        _buildCell(no),
        _buildCell(name),
      ],
    );
  }

  Widget _buildSortButton(int rotationDegree) {
    return AnimatedRotation(
      turns: rotationDegree == -1 ? 0 / 360 : rotationDegree / 360,  // Góc xoay từ 0 đến 1 (0 = 0 độ, 1 = 360 độ); -1 is unactive
      duration: const Duration(milliseconds: 0),  // Thời gian chuyển động
      child: rotationDegree == -1
          ? SvgPicture.asset(
              'sort-icon-unactive.svg',
              width: 24,
              height: 24,
            )
          : SvgPicture.asset(
              'sort-icon.svg',
              width: 24,
              height: 24,
            )
    );
  }

  List<List<String>> sortData(List<List<String>> data, int buttonId, bool ascending) {
    List<List<String>> sortedData = data;
    switch (buttonId) {
      case 1:
        sortedData.sort((a, b) => ascending ? a[0].compareTo(b[0]) : b[0].compareTo(a[0]));
        break;
      case 2:
        sortedData.sort((a, b) => ascending ? a[1].compareTo(b[1]) : b[1].compareTo(a[1]));
        break;
      case 3:
        sortedData.sort((a, b) => ascending ? a[2].compareTo(b[2]) : b[2].compareTo(a[2]));
        break;
      case 4:
        sortedData.sort((a, b) => ascending ? a[3].compareTo(b[3]) : b[3].compareTo(a[3]));
        break;
      case 5:
        sortedData.sort((a, b) => ascending ? a[4].compareTo(b[4]) : b[4].compareTo(a[4]));
        break;
      case 6:
        sortedData.sort((a, b) => ascending ? a[5].compareTo(b[5]) : b[5].compareTo(a[5]));
        break;
      case 7:
        sortedData.sort((a, b) => ascending ? a[6].compareTo(b[6]) : b[6].compareTo(a[6]));
        break;
      case 8:
        sortedData.sort((a, b) => ascending ? a[7].compareTo(b[7]) : b[7].compareTo(a[7]));
        break;
      case 9:
        sortedData.sort((a, b) => ascending ? a[8].compareTo(b[8]) : b[8].compareTo(a[8]));
        break;
      case 10:
        sortedData.sort((a, b) => ascending ? a[9].compareTo(b[9]) : b[9].compareTo(a[9]));
        break;
      case 11:
        sortedData.sort((a, b) => ascending ? a[10].compareTo(b[10]) : b[10].compareTo(a[10]));
        break;
      case 12:
        sortedData.sort((a, b) => ascending ? a[11].compareTo(b[11]) : b[11].compareTo(a[11]));
        break;
      case 13:
        sortedData.sort((a, b) => ascending ? a[12].compareTo(b[12]) : b[12].compareTo(a[12]));
        break;
      case 14:
        sortedData.sort((a, b) => ascending ? a[13].compareTo(b[13]) : b[13].compareTo(a[13]));
        break;
      case 15:
        sortedData.sort((a, b) => ascending ? a[14].compareTo(b[14]) : b[14].compareTo(a[14]));
        break;
      case 16:
        sortedData.sort((a, b) => ascending ? a[15].compareTo(b[15]) : b[15].compareTo(a[15]));
        break;
      case 17:
        sortedData.sort((a, b) => ascending ? a[16].compareTo(b[16]) : b[16].compareTo(a[16]));
        break;
      case 18:
        sortedData.sort((a, b) => ascending ? a[17].compareTo(b[17]) : b[17].compareTo(a[17]));
        break;
      case 19:
        sortedData.sort((a, b) => ascending ? a[18].compareTo(b[18]) : b[18].compareTo(a[18]));
        break;
      case 20:
        sortedData.sort((a, b) => ascending ? a[19].compareTo(b[19]) : b[19].compareTo(a[19]));
        break;
      case 21:
        sortedData.sort((a, b) => ascending ? a[20].compareTo(b[20]) : b[20].compareTo(a[20]));
        break;
      case 22:
        sortedData.sort((a, b) => ascending ? a[21].compareTo(b[21]) : b[21].compareTo(a[21]));
        break;
      case 23:
        sortedData.sort((a, b) => ascending ? a[22].compareTo(b[22]) : b[22].compareTo(a[22]));
        break;
      case 24:
        sortedData.sort((a, b) => ascending ? a[23].compareTo(b[23]) : b[23].compareTo(a[23]));
        break;
      case 25:
        sortedData.sort((a, b) => ascending ? a[24].compareTo(b[24]) : b[24].compareTo(a[24]));
        break;
      case 26:
        sortedData.sort((a, b) => ascending ? a[25].compareTo(b[25]) : b[25].compareTo(a[25]));
        break;
      case 27:
        sortedData.sort((a, b) => ascending ? a[26].compareTo(b[26]) : b[26].compareTo(a[26]));
        break;
      case 28:
        sortedData.sort((a, b) => ascending ? a[27].compareTo(b[27]) : b[27].compareTo(a[27]));
        break;
      case 29:
        sortedData.sort((a, b) => ascending ? a[28].compareTo(b[28]) : b[28].compareTo(a[28]));
        break;
      case 30:
        sortedData.sort((a, b) => ascending ? a[29].compareTo(b[29]) : b[29].compareTo(a[29]));
        break;
      case 31:
        sortedData.sort((a, b) => ascending ? a[30].compareTo(b[30]) : b[30].compareTo(a[30]));
        break;
      case 32:
        sortedData.sort((a, b) => ascending ? a[31].compareTo(b[31]) : b[31].compareTo(a[31]));
        break;
      case 33:
        sortedData.sort((a, b) => ascending ? a[32].compareTo(b[32]) : b[32].compareTo(a[32]));
        break;
      case 34:
        sortedData.sort((a, b) => ascending ? a[33].compareTo(b[33]) : b[33].compareTo(a[33]));
        break;
      case 35:
        sortedData.sort((a, b) => ascending ? a[34].compareTo(b[34]) : b[34].compareTo(a[34]));
        break;
      default:
      throw ArgumentError("Invalid buttonId: $buttonId");
  }
    return sortedData;
  }
}
