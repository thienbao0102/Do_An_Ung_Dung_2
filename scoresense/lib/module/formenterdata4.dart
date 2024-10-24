import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class FormData4 extends StatefulWidget {
  const FormData4({super.key});

  @override
  State<FormData4> createState() => _FormData4State();
}

class _FormData4State extends State<FormData4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Health status",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 20),
        // Health Status Section
        UiDesign.buildRadioLevels(
          'Workday alcohol consumption',
          ['Very low', 'Low', 'Normal', 'High', 'Very high'],
          GlobalData().workdayAlcohol,
          (val) {
            setState(() {
              GlobalData().workdayAlcohol = val;
            });
          },
        ),
        const SizedBox(height: 10),
        UiDesign.buildRadioLevels(
          'Workday alcohol consumption',
          ['Very low', 'Low', 'Normal', 'High', 'Very high'],
          GlobalData().weekendAlcohol,
          (val) {
            setState(() {
              GlobalData().weekendAlcohol = val;
            });
          },
        ),
        const SizedBox(height: 10),
        UiDesign.buildRadioLevels(
          'Current health status',
          ['Very bad', 'Bad', 'Fair','Good','Excellent'],
          GlobalData().currentHealth,
          (val) {
            setState(() {
              GlobalData().currentHealth = val;
            });
          },
        ),
        const SizedBox(height: 20),
        const Text(
          "Family Connections",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 20),
        UiDesign.buildRadioButtonGroupRow(
          "Your family size",
          ['Greater than 3', 'Less than or equal to 3'],
          GlobalData().familySize,
          (value) {
                setState(() {
                  GlobalData().familySize = value;
                });
              },
        ),
        const SizedBox(height: 10),
        // Family Connections Section
        UiDesign.buildRadioLevels(
          'Quality of family relationships',
          ['Very bad', 'Bad', 'Fair','Good','Excellent'],
          GlobalData().familyQuality,
          (val) {
            setState(() {
              GlobalData().familyQuality = val;
            });
          },
        ),

      ],
    );
  }
}
