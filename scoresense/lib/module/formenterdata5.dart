import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData5 extends StatefulWidget {
  @override
  _FormData5State createState() => _FormData5State();
}

class _FormData5State extends State<FormData5> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // const SizedBox(height: 60),
      Center(
        child:
          const Text(
            "Do you participate in or receive support for the following activities?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0062FF),
            ),
          ),
      ),
      const SizedBox(height: 50),
      UiDesign.buildRadioButtonSupport(
        "School support",
        ['Yes', 'No'],
        GlobalData().schoolSupport,
        (value) {
          setState(() {
            GlobalData().schoolSupport = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "Family support",
        ['Yes', 'No'],
        GlobalData().familySupport,
        (value) {
          setState(() {
            GlobalData().familySupport = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "Extra paid classes",
        ['Yes', 'No'],
        GlobalData().paidClasses,
        (value) {
          setState(() {
            GlobalData().paidClasses = value;
          });
        },
      ),
      const SizedBox(height: 30),
      UiDesign.buildRadioButtonSupport(
        "Extracurricular activities",
        ['Yes', 'No'],
        GlobalData().extracurricularActivities,
        (value) {
          setState(() {
            GlobalData().extracurricularActivities = value;
          });
        },
      ),
    ]);
  }
}
