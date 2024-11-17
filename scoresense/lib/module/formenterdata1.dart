import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: UiDesign.buildTextField(
                        "Your First name",
                        (value) => GlobalData().firstName = value,
                      ),
                    ),
                    const SizedBox(width: 200),
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
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [                 
                  ElevatedButton(
                    onPressed: () {
                      if (GlobalData().firstName.isEmpty||GlobalData().lastName.isEmpty||GlobalData().age==0||GlobalData().school.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: 
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),  // Bo góc trên bên trái
                                    topRight: Radius.circular(10), // Bo góc trên bên phải
                                    bottomLeft: Radius.circular(10), // Bo góc dưới bên trái
                                    bottomRight: Radius.circular(10), // Bo góc dưới bên phải
                                  ),
                                  child: Center(
                                    child: 
                                    Container(
                                      padding: const EdgeInsets.only(top: 10, right: 20, bottom: 20, left: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      constraints: const BoxConstraints(
                                        maxWidth: 400,
                                      ),
                                      child: 
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            '11104.png',
                                            width: 300,
                                            fit: BoxFit.contain,
                                            colorBlendMode: BlendMode.saturation,  // Mượt mà hơn khi xử lý các cạnh
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Alert!",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: GlobalData().colorText,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Please finish at least the questions on Page 1 before continuing!",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: GlobalData().colorText,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 20),
                                          MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child:
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: 
                                                Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                  width: double.infinity,  // Chiếm hết chiều ngang
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF0062FF),
                                                    borderRadius: BorderRadius.circular(8.0)),
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      letterSpacing: 1.3,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ),
                              );
                          },
                        );
                      } else {
                        // print(GlobalData().age);
                        // print(GlobalData().lastName);
                        // print(GlobalData().firstName);
                        // print(GlobalData().school);
                        if (isLastPage) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PersonalResultPage(),
                            ),
                          );
                        } else {
                          onNext();
                        }
                      }
                    },
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
