import 'package:flutter/material.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/predictions.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:scoresense/module/callbackend.dart';
import 'package:scoresense/pages/predictformdata.dart';

import '../module/global_variable.dart';

class PersonalResultPage extends StatefulWidget {
  const PersonalResultPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalResultPageState createState() => _PersonalResultPageState();
}

class _PersonalResultPageState extends State<PersonalResultPage> {
  bool _isLoading = true;
  List<Predictions> results = List.empty();
  String _result = "";
  Future<void> _loadData() async {
    List<Map<String, dynamic>> dataPredict = [
      {
        "school": GlobalData().school,
        "sex": GlobalData().gender=="Male"?"M":"F",
        "age": GlobalData().age,
        "address": GlobalData().location=="Urban"?"U":"R",
        "famsize": GlobalData().familySize == "Less than or equal to 3"?"LS3":"GT3",
        "Pstatus": GlobalData().parentStatus=="Apart"?"A":"T",
        "Medu": GlobalData().motherEducation,
        "Fedu": GlobalData().fatherEducation,
        "Mjob": GlobalData().motherJob.toLowerCase(),
        "Fjob": GlobalData().fatherJob.toLowerCase(),
        "reason": GlobalData().reason.toLowerCase(),
        "guardian": GlobalData().guardian.toLowerCase(),
        "traveltime": GlobalData().travelTimeIndex + 1,
        "studytime": GlobalData().weeklyStudyTime + 1,
        "failures": GlobalData().numOfFailClass, //ko cong 1
        "schoolsup": GlobalData().schoolSupport.toLowerCase(),
        "famsup": GlobalData().familySupport.toLowerCase(),
        "paid": GlobalData().paidClasses.toLowerCase(),
        "activities": GlobalData().extracurricularActivities.toLowerCase(),
        "nursery": GlobalData().nurserySchool.toLowerCase(),
        "higher": GlobalData().higherEducation.toLowerCase(),
        "internet": GlobalData().internetAtHome.toLowerCase(),
        "romantic": GlobalData().relationship.toLowerCase(),
        "famrel": GlobalData().familyQuality + 1,
        "freetime": GlobalData().freeTimeIndex + 1,
        "goout": GlobalData().goOutIndex + 1,
        "Dalc": GlobalData().workdayAlcohol + 1,
        "Walc": GlobalData().weekendAlcohol + 1,
        "health": GlobalData().currentHealth + 1,
        "absences": GlobalData().absences,
        "G1": GlobalData().G1,
        "G2": GlobalData().G2
      }
    ];
    List<dynamic> headers = dataPredict[0].keys.toList();
    List<List<dynamic>> convertedData = dataPredict.map((map) {
     return map.values.toList();
  }).toList();

    

    List<List<dynamic>> result = [headers] + convertedData;
    // print(result);
    results = await sendData(result,GlobalData().version);
    // print("results: " + results.toString());
    setState(() {
      _isLoading = false;
      _result = results[0].prediction > 10 ? "Pass" : "Fail";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String titleResultPage = _result == "Pass" ? "Congratulation!" : "Improvement...";
    String descriptionResultPage = _result == "Pass"
        ? "Your hard work has paid off! Celebrate this achievement and keep reaching for new heights!"
        : "Every step forward counts. Embrace the journey of growth and keep striving for your best!";
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 184, 211, 255), // Màu nền
              // gradient: LinearGradient(
              //   colors: [
              //     Colors.white, // Màu nền 1
              //     Colors.lightBlue, // Màu nền 2
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
            ),
          ),
          // Viền tròn lớn
          Positioned(
            left: screenSize.width * -0.3,
            bottom: screenSize.height * -0.3,
            child: Container(
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xFF79ACFF), // Màu viền
                  width: 80,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Viền tròn nhỏ
          Positioned(
            right: screenSize.width * -0.2,
            top: screenSize.height * -0.2,
            child: Container(
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xFF79ACFF), // Màu viền
                  width: 80,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Header(setColor: GlobalData().colorPrimary,),
          ),
          // Nội dung chính ở giữa
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.5,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Cho phép Column tự điều chỉnh chiều cao
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Đặt nội dung căn lề trái
                    children: [
                      AutoSizeText(
                        titleResultPage,
                        style: const TextStyle(
                          fontSize: 36, // Kích thước mặc định
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0062FF), // Màu chữ
                        ),
                        maxLines: 1,
                        minFontSize: 16, // Kích thước nhỏ nhất có thể thu nhỏ
                        maxFontSize: 36, // Kích thước tối đa có thể phóng to
                        overflow: TextOverflow.ellipsis,
                      ),
                      AutoSizeText(
                        descriptionResultPage,
                        style: TextStyle(
                          fontSize: 16, // Kích thước mặc định
                          fontWeight: FontWeight.normal,
                          color: GlobalData().colorText // Màu chữ
                        ),
                        maxLines: 2,
                        minFontSize: 13, // Kích thước nhỏ nhất có thể thu nhỏ
                        maxFontSize: 20, // Kích thước tối đa có thể phóng to
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: screenSize.width * 0.5,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 50),
                              // padding: const EdgeInsets.all(10.0), // Padding bên trong
                              alignment: Alignment.center, // Căn giữa nội dung
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  UiDesign().buildAnimatedPieChart(
                                      "",100,_result == "Pass" ? const Color(0xFF04CB6E) : const Color(0xFFE74C3C)),
                                  UiDesign().addTextToAnimatedPieChart(
                                    _result == "Pass" ? const Color(0xFF04CB6E) : const Color(0xFFE74C3C),_result
                                      ),
                                ],
                              )
                              // UiDesign().buildPieChart(100), // Widget Pie Chart
                              ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Căn giữa tiêu đề
                                  children: [
                                    Text(
                                      "Outcome",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF0062FF),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text(
                                        "Student:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${GlobalData().firstName} ${GlobalData().lastName}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Text(
                                        "School:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      GlobalData().school,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Predicted Pass Rate:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      _result,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: _result == "Pass" ? const Color(0xFF04CB6E) : const Color(0xFFE74C3C),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EnterFormData()), // Thay thế ChoosePredictMethodPage bằng widget của bạn
                      (Route<dynamic> route) =>
                          false, // Loại bỏ tất cả các trang trước đó
                    );
                    //GlobalData().resetValues();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF0062FF), // Màu nền
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bo góc
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 18), // Padding tùy chọn
                  ),
                  child: const Text(
                    'Retake the test',
                    style: TextStyle(
                      color: Color(0xFBFBFBFB), // Màu chữ
                      fontSize: 16,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
