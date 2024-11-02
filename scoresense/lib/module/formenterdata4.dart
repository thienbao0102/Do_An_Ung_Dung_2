import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';
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
        width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(top: 70, bottom: 20),
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 30),
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
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                UiDesign.buildRadioLevels(
                  'Weekend alcohol consumption',
                  ['Very low', 'Low', 'Normal', 'High', 'Very high'],
                  GlobalData().weekendAlcohol,
                  (val) => GlobalData().weekendAlcohol = val,
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Family Connections",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                UiDesign.buildRadioButtonGroupRow(
                  "Your family size",
                  ['Greater than 3', 'Less than or equal to 3'],
                  GlobalData().familySize,
                  (value) => GlobalData().familySize = value,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    UiDesign.buildRadioLevels(
                      'Quality of family relationships',
                      ['Very bad', 'Bad', 'Fair', 'Good', 'Excellent'],
                      GlobalData().familyQuality,
                      (val) => GlobalData().familyQuality = val,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
