import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData3 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData3({
    Key? key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000.0),
        width: MediaQuery.of(context).size.width * 0.65,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.only(
            top: 30, left: 50, right: 50, bottom: 30),
        child: Stack(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Center(
                  child: Text(
                    "Your daily activities",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Free time after school
                Column(
                  children: [
                    UiDesign.buildRadioLevelsLabel('Free time after school',
                        ['Very low', 'Low', 'Normal', 'High', 'Very high']),
                    UiDesign.buildRadioLevels(
                      'Free time after school',
                      ['Very low', 'Low', 'Normal', 'High', 'Very high'],
                      GlobalData().freeTimeIndex,
                      (index) => GlobalData().freeTimeIndex = index,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Home to school travel time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiDesign.buildRadioLevelsLabel(
                        'Home to school travel time',
                        ['< 15"', '15" to 30"', '30" to 1 hour', '> 1 hour']),
                    UiDesign.buildRadioLevels(
                      'Home to school travel time',
                      ['< 15"', '15" to 30"', '30" to 1 hour', '> 1 hour'],
                      GlobalData().travelTimeIndex,
                      (index) => GlobalData().travelTimeIndex = index,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Go out with friends
                Column(
                  children: [
                    UiDesign.buildRadioLevelsLabel(
                        'Go out with friends', [
                      'Very rarely',
                      'Rarely',
                      'Sometimes',
                      'Often',
                      'Very often'
                    ]),
                    UiDesign.buildRadioLevels(
                      'Go out with friends',
                      ['Very rarely', 'Rarely', 'Sometimes', 'Often', 'Very often'],
                      GlobalData().goOutIndex,
                      (index) => GlobalData().goOutIndex = index,
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
