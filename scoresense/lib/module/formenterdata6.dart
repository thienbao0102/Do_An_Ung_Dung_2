import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData6 extends StatefulWidget {
  @override
  _FormData6State createState() => _FormData6State();
}

class _FormData6State extends State<FormData6> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 60),
      const Text(
        "Do you participate in or receive support for the following activities?",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0062FF),
        ),
      ),
      const SizedBox(height: 50),
      UiDesign.buildRadioButtonSupport(
        "Attended nursery school",
        ['Yes', 'No'],
        GlobalData().nurserySchool,
        (value) {
          setState(() {
            GlobalData().nurserySchool = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "Aspiration for higher education",
        ['Yes', 'No'],
        GlobalData().higherEducation,
        (value) {
          setState(() {
            GlobalData().higherEducation = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "Access to internet at home",
        ['Yes', 'No'],
        GlobalData().internetAtHome,
        (value) {
          setState(() {
            GlobalData().internetAtHome = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "In a romantic relationship",
        ['Yes', 'No'],
        GlobalData().relationship,
        (value) {
          setState(() {
            GlobalData().relationship = value;
          });
        },
      ),
    ]);
  }
}
