import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData6 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData6({
    Key? key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Container(
        constraints: const BoxConstraints(
              maxWidth: 1000.0,
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.only(top: 70, bottom: 20),
            padding: const EdgeInsets.only(
                top: 50, left: 50, right: 50, bottom: 30),
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
            ), // Chiều rộng cụ thể cho FormData5
        child: 
          Stack(
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                const Text(
                  "Do you participate in or receive support for the following activities?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0062FF),
                  ),
                ),
                const SizedBox(height: 50),
                UiDesign.buildRadioButtonYesNo(
                  "Attended nursery school",
                  ['Yes', 'No'],
                  GlobalData().nurserySchool,
                  (value) => GlobalData().nurserySchool = value,
                ),
                const SizedBox(height: 30),
                UiDesign.buildRadioButtonYesNo(
                  "Aspiration for higher education",
                  ['Yes', 'No'],
                  GlobalData().higherEducation,
                  (value) => GlobalData().higherEducation = value,
                ),
                const SizedBox(height: 30),
                UiDesign.buildRadioButtonYesNo(
                  "Access to internet at home",
                  ['Yes', 'No'],
                  GlobalData().internetAtHome,
                  (value) => GlobalData().internetAtHome = value,
                ),
                const SizedBox(height: 30),
                UiDesign.buildRadioButtonYesNo(
                  "In a romantic relationship",
                  ['Yes', 'No'],
                  GlobalData().relationship,
                  (value) => GlobalData().relationship = value,
                ),
                const SizedBox(height: 60),
              ]),
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
          )
      )
    );
  }
}
