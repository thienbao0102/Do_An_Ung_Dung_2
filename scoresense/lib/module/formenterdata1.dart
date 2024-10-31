import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData1 extends StatefulWidget {
  @override
  _FormData1State createState() => _FormData1State();
}

class _FormData1State extends State<FormData1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // Thêm SingleChildScrollView
        child: Padding(
      padding: const EdgeInsets.all(0), // Thêm padding để cách biên
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: (Text(
            "Give me your information",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0062FF),
            ),
          ))),

          const SizedBox(
              height: 50), // Khoảng cách giữa tiêu đề và các ô nhập liệu
          // First and Last Name Row
          Row(
            children: [
              Expanded(
                child: UiDesign.buildTextField(
                  "Your First name",
                  (value) {
                    setState(() {
                      GlobalData().firstName = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 100), // Khoảng cách giữa hai text field
              Expanded(
                child: UiDesign.buildTextField(
                  "Your Last name",
                  (value) {
                    setState(() {
                      GlobalData().lastName = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 50), // Khoảng cách giữa các hàng
          // Gender and Location Row
          Row(
            children: [
              Expanded(
                child: UiDesign.buildRadioButtonGroup(
                  "Gender?",
                  ['Male', 'Female'],
                  GlobalData().gender,
                  (value) {
                    setState(() {
                      GlobalData().gender = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: UiDesign.buildRadioButtonGroup(
                  "Home location?",
                  ['Urban', 'Rural'],
                  GlobalData().location,
                  (value) {
                    setState(() {
                      GlobalData().location = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40), // Khoảng cách giữa các hàng
              // Age input
              UiDesign.buildTextField2("Your age?", true)
            ],
          ),

          const SizedBox(height: 40), // Khoảng cách giữa các hàng
          // School Name
          UiDesign.buildTextField(
            "What school are you in?",
            (value) {
              setState(() {
                GlobalData().school = value;
              });
            },
          ),
          const SizedBox(height: 40), // Khoảng cách cuối cùng
        ],
      ),
      //const SizedBox(height: 110),
    ));
  }
}
