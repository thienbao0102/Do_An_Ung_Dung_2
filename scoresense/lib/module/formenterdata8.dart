import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData8 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData8({
    super.key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        // Thêm SingleChildScrollView
        child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1000.0,
            ),
            width: MediaQuery.of(context).size.width * 0.65,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            padding:
                const EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 30),
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
            ), // Chiều rộng cụ thể cho FormData2
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Family connections",
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
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 30),
                    const Center(
                        child: (Text(
                      "Other information",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0062FF),
                      ),
                    ))),
                    const SizedBox(
                        height:
                            30), // Khoảng cách giữa tiêu đề và các ô nhập liệu
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // RatingSlider(
                        //   question: "Reason to choose this school",
                        //   labels: [
                        //     'Course',
                        //     'Home',
                        //     'Reputation',
                        //     'Other'
                        //   ], // Truyền danh sách labels
                        //   onChanged: (option) =>
                        //       GlobalData().weeklyStudyTime = option,
                        //   initialSelectedValue: GlobalData().weeklyStudyTime,
                        // ),
                        // RatingSlider(
                        //   question: "Your guardian",
                        //   labels: [
                        //     'Mother',
                        //     'Father',
                        //     'Other'
                        //   ], // Truyền danh sách labels
                        //   onChanged: (option) =>
                        //       GlobalData().weeklyStudyTime = option,
                        //   initialSelectedValue: GlobalData().weeklyStudyTime,
                        // ),
                        UiDesign.buildRadioButtonGroupRow(
                          "Reason to choose this school",
                          ['Course', 'Home', 'Reputation', 'Other'],
                          GlobalData().reason,
                          (value) => GlobalData().reason = value,
                        ),const SizedBox(height: 30),

                        UiDesign.buildRadioButtonGroupRow(
                          "Your guardian",
                          ['Mother','Father','Other'],
                          GlobalData().guardian,
                          (value) => GlobalData().guardian = value,
                        )
                      ],
                    ),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
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
                                    builder: (context) =>
                                        const PersonalResultPage(),
                                  ),
                                )
                            : onNext,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 15),
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
            )));
  }
}
