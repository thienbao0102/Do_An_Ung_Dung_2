import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData7 extends StatefulWidget {
  @override
  _FormData7State createState() => _FormData7State();
}

class _FormData7State extends State<FormData7> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Thêm SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.all(0), // Thêm padding để cách biên
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: (
                Text(
                  "Your learning process",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0062FF),
                  ),
                )
              )
            ),
            SizedBox(height: 30), // Khoảng cách giữa tiêu đề và các ô nhập liệu
            Row(
              children: [
                UiDesign.buildRadioLevels(
                  'Weekly study time',
                  ['< 2 hours', '2 to 5 hours', '5 to 10 hours', '> 10 hours'],
                  GlobalData().weeklyStudyTime,
                  (index) {
                    setState(() {
                      GlobalData().weeklyStudyTime = index;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20), // Khoảng cách giữa tiêu đề và các ô nhập liệu
            Row(
              children: [
                UiDesign.buildRadioLevels(
                  'Number of past class failures',
                  ['0', '1', '2', '3', '4'],
                  GlobalData().numOfFailClass,
                  (index) {
                    setState(() {
                      GlobalData().numOfFailClass = index;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40), // Khoảng cách giữa tiêu đề và các ô nhập liệu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: ,
              children: [
                UiDesign.buildTextField2("Number of times absent?", true),
                UiDesign.buildTextField2("Semester 1 score?", true),
                UiDesign.buildTextField2("Semester 2 score??", true),
              ],
            )
          ],
        ),
      ),
    );
  }
}
