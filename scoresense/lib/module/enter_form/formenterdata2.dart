import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ratingSlider.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData2 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData2({
    Key? key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sizeChangeToSlideBar = 900;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000.0, minHeight: 500),
        width: MediaQuery.of(context).size.width * 0.65,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding:
            const EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 30),
        child: Stack(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Your parents' information",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                MediaQuery.of(context).size.width > sizeChangeToSlideBar
                    ? UiDesign.buildRadioButtonGroupRow(
                        "Father's education",
                        [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ],
                        [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ].elementAt(GlobalData().fatherEducation), (value) {
                        int index = [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ].indexOf(value);
                        GlobalData().fatherEducation = index;
                      })
                    : RatingSlider(
                        question: "Father's education",
                        labels: const [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ],
                        initialSelectedValue: GlobalData().fatherEducation,
                        onChanged: (option) =>
                            GlobalData().fatherEducation = option,
                      ),
                const SizedBox(height: 10),
                MediaQuery.of(context).size.width > sizeChangeToSlideBar
                    ? UiDesign.buildRadioButtonGroupRow(
                        "Father's education",
                        [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ],
                        [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ].elementAt(GlobalData().motherEducation),
                        (value) {
                          [
                            'None',
                            'Primary',
                            '5th to 9th grade',
                            'Secondary',
                            'Higher education'
                          ].indexOf(value);
                          GlobalData().motherEducation = value as int;
                        },
                      )
                    : RatingSlider(
                        question: "Mother's education",
                        labels: const [
                          'None',
                          'Primary',
                          '5th to 9th grade',
                          'Secondary',
                          'Higher education'
                        ],
                        initialSelectedValue: GlobalData().motherEducation,
                        onChanged: (option) =>
                            GlobalData().motherEducation = option,
                      ),
                const SizedBox(height: 30),
                MediaQuery.of(context).size.width > sizeChangeToSlideBar
                    ? UiDesign.buildRadioButtonGroupRow(
                        "Mother's job",
                        ['At_home', 'Health', 'Services', 'Teacher', 'Other'],
                        GlobalData().motherJob,
                        (value) => GlobalData().motherJob = value,
                      )
                    : RatingSlider(
                        question: "Mother's job",
                        labels: const [
                          'At_home',
                          'Health',
                          'Services',
                          'Teacher',
                          'Other'
                        ],
                        initialSelectedValue: [
                          'At_home',
                          'Health',
                          'Services',
                          'Teacher',
                          'Other'
                        ].indexOf(GlobalData().motherJob),
                        onChanged: (option) {
                          String value = [
                            'At_home',
                            'Health',
                            'Services',
                            'Teacher',
                            'Other'
                          ].elementAt(option);
                          GlobalData().motherJob = value;
                        }),
                const SizedBox(height: 30),
                MediaQuery.of(context).size.width > sizeChangeToSlideBar?
                UiDesign.buildRadioButtonGroupRow(
                  "Father's job",
                  ['At_home', 'Health', 'Services', 'Teacher', 'Other'],
                  GlobalData().fatherJob,
                  (value) => GlobalData().fatherJob = value,
                ):
                RatingSlider(
                        question: "Father's job",
                        labels: const [
                          'At_home',
                          'Health',
                          'Services',
                          'Teacher',
                          'Other'
                        ],
                        initialSelectedValue: [
                          'At_home',
                          'Health',
                          'Services',
                          'Teacher',
                          'Other'
                        ].indexOf(GlobalData().fatherJob),
                        onChanged: (option) {
                          String value = [
                            'At_home',
                            'Health',
                            'Services',
                            'Teacher',
                            'Other'
                          ].elementAt(option);
                          GlobalData().fatherJob = value;
                        }),
                const SizedBox(height: 30),
                UiDesign.buildRadioButtonGroupRow(
                  "Parent status",
                  ['Apart', 'Together'],
                  GlobalData().parentStatus,
                  (value) => GlobalData().parentStatus = value,
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
        ),
      ),
    );
  }
}
