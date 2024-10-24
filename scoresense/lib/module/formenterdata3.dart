import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData3 extends StatefulWidget {
  @override
  _FormData3State createState() => _FormData3State();
}

class _FormData3State extends State<FormData3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 60),
        const Text(
          "Your daily",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 40),
        UiDesign.buildRadioLevels(
          'Free time after school',
          ['Very low', 'Low', 'Normal', 'High', 'Very high'],
          GlobalData().freeTimeIndex,
          (index) {
            setState(() {
              GlobalData().freeTimeIndex = index;
            });
          },
        ),
        const SizedBox(height: 40),
        UiDesign.buildRadioLevels(
          'Home to school travel time',
          ['< 15"', '15" to 30"', '30" to 1 hour', '> 1 hour'],
          GlobalData().travelTimeIndex,
          (index) {
            setState(() {
              GlobalData().travelTimeIndex = index;
            });
          },
        ),
        const SizedBox(height: 40),
        UiDesign.buildRadioLevels(
          'Go out with friends',
          ['Very rarely', 'Rarely', 'Sometimes', 'Often', 'Very often'],
          GlobalData().goOutIndex,
          (index) {
            setState(() {
              GlobalData().goOutIndex = index;
            });
          },
        ),
     ],
    );
  }
}
