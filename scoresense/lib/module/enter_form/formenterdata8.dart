import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
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
                    const SizedBox(height: 40),
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
              ],
            )));
  }
}
