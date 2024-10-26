import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData1 extends StatefulWidget {
  //const FormData1({super.key});

  @override
  _FormData1State createState() => _FormData1State();
}

class _FormData1State extends State<FormData1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        const Text(
          "Give me your information",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 50),

        // First Name & Last Name Fields
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,            
            children: [
              UiDesign.buildTextField(
                "Your First name",
                (value) {
                  setState(() {
                    GlobalData().firstName = value;
                  });
                },
              ),
              UiDesign.buildTextField(
                "Your Last name",
                (value) {
                  setState(() {
                    GlobalData().lastName = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),

        // Gender and Location Fields
        SizedBox(
          width: double.infinity,
          child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            UiDesign.buildRadioButtonGroup(
              "Gender?",
              ['Male', 'Female'],
              GlobalData().gender,
              (value) {
                setState(() {
                  GlobalData().gender = value;
                });
              },
            ),
            UiDesign.buildRadioButtonGroup(
              "Home location?",
              ['Urban', 'Rural'],
              GlobalData().location,
              (value) {
                setState(() {
                  GlobalData().location = value;
                });
              },
            ),
            UiDesign.buildTextField(
              "Your age?",
              (value) {
                setState(() {
                  GlobalData().age = int.parse(value) ;
                });
              },
            ),
          ],
        ),
        ),
        const SizedBox(height: 60),

        // School Name
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UiDesign.buildTextField(
              "What school are you in?",
              (value) {
                setState(() {
                  GlobalData().school = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 110),
      ],
    );
  }
}
