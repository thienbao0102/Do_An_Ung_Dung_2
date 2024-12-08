import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData5 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData5({
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
            width: MediaQuery.of(context).size.width * 0.65,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            padding: const EdgeInsets.only(
                top: 30, left: 50, right: 50, bottom: 30),
          child:
            Stack(
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // const SizedBox(height: 60),
                  const Center(
                    child:
                      Text(
                        "Do you participate in or receive support for the following activities?",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0062FF),
                        ),
                      ),
                  ),
                  const SizedBox(height: 50),
                  UiDesign.buildRadioButtonYesNo(
                    "School support",
                    ['Yes', 'No'],
                    GlobalData().schoolSupport,
                    (value) => GlobalData().schoolSupport = value,
                  ),
                  const SizedBox(height: 30),
                  UiDesign.buildRadioButtonYesNo(
                    "Family support",
                    ['Yes', 'No'],
                    GlobalData().familySupport,
                    (value) => GlobalData().familySupport = value
                  ),
                  const SizedBox(height: 30),
                  UiDesign.buildRadioButtonYesNo(
                    "Extra paid classes",
                    ['Yes', 'No'],
                    GlobalData().paidClasses,
                    (value) =>
                        GlobalData().paidClasses = value
                  ),
                  const SizedBox(height: 30),
                  UiDesign.buildRadioButtonYesNo(
                    "Extracurricular activities",
                    ['Yes', 'No'],
                    GlobalData().extracurricularActivities,
                    (value) => GlobalData().extracurricularActivities = value
                  ),
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