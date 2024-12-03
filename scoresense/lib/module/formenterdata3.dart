import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
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

            // Navigation buttons
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button, only visible if onPrevious is provided
                  if (onPrevious != null)
                    TextButton(
                      onPressed: onPrevious,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xFF0062FF)),
                        ),
                      ),
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          color: Color(0xFF0062FF),
                          letterSpacing: 1.3,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  // Next or Submit button
                  ElevatedButton(
                    onPressed: isLastPage
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalResultPage(),
                              ),
                            )
                        : onNext,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      backgroundColor: const Color(0xFF0062FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      isLastPage ? 'Submit' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
