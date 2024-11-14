import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';
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
        ),
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
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: UiDesign.buildTextField(
                        "Your First name",
                        (value) => GlobalData().firstName = value,
                      ),
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      child: UiDesign.buildTextField(
                        "Your Last name",
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
                              UiDesign.buildTextField2("Your age?", true,(value) => GlobalData().age = int.parse(value)),
                            
                            ],
                          )
                        
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                UiDesign.buildTextField(
                  "What school are you in?",
                  (value) => GlobalData().school = value,
                ),const SizedBox(height: 60),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                 
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
