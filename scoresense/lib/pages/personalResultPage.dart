import 'package:flutter/material.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/choosepredictmethod.dart';
import 'package:scoresense/module/ui_design.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PersonalResultPage extends StatefulWidget {
  const PersonalResultPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalResultPageState createState() => _PersonalResultPageState();
}

class _PersonalResultPageState extends State<PersonalResultPage> {
  @override
  double _percentInRadians = 100.0;
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
          const Positioned(
                  top: 40,
                  left: 120,
                  child: Header(),
                ),
          // Nội dung chính ở giữa
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.4,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min, // Cho phép Column tự điều chỉnh chiều cao
                    crossAxisAlignment: CrossAxisAlignment.start, // Đặt nội dung căn lề trái
                    children: [
                      AutoSizeText(
                        "Excellent! This is the highest I've ever seen",
                        style: TextStyle(
                          fontSize: 36, // Kích thước mặc định
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0062FF), // Màu chữ
                        ),
                        maxLines: 1,
                        minFontSize: 16,  // Kích thước nhỏ nhất có thể thu nhỏ
                        maxFontSize: 36,  // Kích thước tối đa có thể phóng to
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Congratulations on your perfect score! Keep up the great work and continue to challenge yourself—there's always room for growth!",
                        style: TextStyle(
                          fontSize: 20, // Giảm kích thước font cho đoạn văn
                          fontWeight: FontWeight.normal, // Thay đổi độ đậm
                        ),
                        textAlign: TextAlign.left, // Căn trái đoạn văn
                      ),
                    ],
                  ),
                ),const SizedBox(height: 15),
                Container(
                  width: screenSize.width * 0.4,
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
                                UiDesign().buildAnimatedPieChart("", _percentInRadians),
                                UiDesign().addTextToAnimatedPieChart(_percentInRadians),
                              ],
                            )
                            // UiDesign().buildPieChart(100), // Widget Pie Chart
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Căn giữa tiêu đề
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
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    SizedBox(
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
                                      "Hoai Bao Linh",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
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
                                      "Van Lang University",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
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
                                      "100%",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}