import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData2 extends StatefulWidget {


  @override
  State<FormData2> createState() => _FormData2State();
}

class _FormData2State extends State<FormData2> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          const Text(
            "Your parents information",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0062FF)),
          ),
          const SizedBox(height: 30),

          // Father's Education
          UiDesign.buildRadioButtonGroupRow(
            "Father's education",
            [
              'None',
              'Primary',
              '5th to 9th grade',
              'Secondary',
              'Higher education'
            ],
            GlobalData().fatherEducation,
            (value) {
              setState(() {
                GlobalData().fatherEducation = value;
              });
            },
          ),
          const SizedBox(height: 30),

          // Mother's Education
          UiDesign.buildRadioButtonGroupRow(
            "Mother's education",
            [
              'None',
              'Primary',
              '5th to 9th grade',
              'Secondary',
              'Higher education'
            ],
            GlobalData().motherEducation,
            (value) {
              setState(() {
                GlobalData().motherEducation = value;
              });
            },
          ),
          const SizedBox(height: 30),

          // Mother's Job
          UiDesign.buildRadioButtonGroupRow(
            "Mother's job",
            ['At home', 'Health', 'Services', 'Teacher', 'Other'],
            GlobalData().motherJob,
            (value) {
              setState(() {
                GlobalData().motherJob = value;
              });
            },
          ),
          const SizedBox(height: 30),

          // Father's Job
          UiDesign.buildRadioButtonGroupRow(
            "Father's job",
            ['At home', 'Health', 'Services', 'Teacher', 'Other'],
            GlobalData().fatherJob,
            (value) {
              setState(() {
                GlobalData().fatherJob = value;
              });
            },
          ),
          const SizedBox(height: 30),

          // Parent Status
          UiDesign.buildRadioButtonGroupRow(
            "Parent status",
            ['Apart', 'Together'],
            GlobalData().parentStatus,
            (value) {
              setState(() {
                GlobalData().parentStatus = value;
              });
            },
          ),

        ]);
  }


}
