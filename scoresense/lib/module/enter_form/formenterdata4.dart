import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData4 extends StatelessWidget {  // Changed to StatefulWidget
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData4({
    Key? key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 1000.0,
        ),
        width: MediaQuery.of(context).size.width * 0.65,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 30),
        child: Stack(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Health status",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    UiDesign.buildRadioLevelsLabel(
                      'Workday alcohol consumption',
                      ['Very low', 'Low', 'Normal', 'High', 'Very high']
                    ),
                    UiDesign.buildRadioLevels(
                      'Workday alcohol consumption',
                      ['Very low', 'Low', 'Normal', 'High', 'Very high'],
                      GlobalData().workdayAlcohol,
                      (val) => GlobalData().workdayAlcohol = val,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                UiDesign.buildRadioLevels(
                  'Weekend alcohol consumption',
                  ['Very low', 'Low', 'Normal', 'High', 'Very high'],
                  GlobalData().weekendAlcohol,
                  (val) => GlobalData().weekendAlcohol = val,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    UiDesign.buildRadioLevelsLabel(
                      'Current health status',
                      ['Very bad', 'Bad', 'Fair', 'Good', 'Excellent']
                    ),
                    UiDesign.buildRadioLevels(
                      'Current health status',
                      ['Very bad', 'Bad', 'Fair', 'Good', 'Excellent'],
                      GlobalData().currentHealth,
                      (val) => GlobalData().currentHealth = val,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
