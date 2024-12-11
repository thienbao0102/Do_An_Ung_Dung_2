import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData1 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData1({
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
                const Center(
                  child: Text(
                    "Give me your information",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: UiDesign.buildTextField(
                        "Your First name",
                        GlobalData().firstName,
                        (value) => GlobalData().firstName = value,
                      ),
                    ),
                    const SizedBox(width: 200),
                    Expanded(
                      child: UiDesign.buildTextField(
                        "Your Last name",
                        GlobalData().lastName,
                        (value) => GlobalData().lastName = value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 50,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                          UiDesign.buildRadioButtonGroup(
                            "Gender?",
                            ['Male', 'Female'],
                            GlobalData().gender,
                            (value) => GlobalData().gender = value,
                        ),
                          ]
                        ),
                        Column(
                          children: [
                            UiDesign.buildRadioButtonGroup(
                            "Home location?",
                            ['Urban', 'Rural'],
                            GlobalData().location,
                            (value) => GlobalData().location = value,
                          ),
                          ],
                        ),
                          Column(
                            children: [
                              UiDesign.buildTextField2("Your age?",GlobalData().age.toString(), true,(value) => GlobalData().age = int.parse(value)),
                            ],
                          )
                        
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                UiDesign.buildTextField(
                  "What school are you in?",
                  GlobalData().school,
                  (value) => GlobalData().school = value,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
