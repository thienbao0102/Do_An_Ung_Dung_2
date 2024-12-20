import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
import 'package:scoresense/module/ui_design/ratingSlider.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class FormData7 extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final bool isLastPage;

  const FormData7({
    Key? key,
    required this.onNext,
    this.onPrevious,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Thêm SingleChildScrollView
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
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: (Text(
                    "Your learning process",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF),
                    ),
                  ))),
                  SizedBox(height: 40), // Khoảng cách giữa tiêu đề và các ô nhập liệu
                   Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingSlider(
                        question: "Weekly study time",
                        labels: const ['Very low', 'Low', 'Average', 'High', 'Very high'], // Truyền danh sách labels
                        onChanged: (option) => GlobalData().weeklyStudyTime = option,
                        initialSelectedValue:  GlobalData().weeklyStudyTime,
                        
                      ),
                      SizedBox(height: 20), // Khoảng cách giữa tiêu đề và các ô nhập liệu
                      //StarRating(question: "Number of past class failures"),
                     RatingSlider(
                        question: "Number of past class failures",
                        labels: const ['0', '1', '2', '3', '4'], // Truyền danh sách labels
                        onChanged: (option) => GlobalData().numOfFailClass = option,
                        initialSelectedValue:  GlobalData().numOfFailClass,
                        
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Khoảng cách giữa tiêu đề và các ô nhập liệu
                  // Column(
                  //   children: [
                  //     UiDesign.buildRadioLevelsLabel(
                  //         'Number of past class failures',
                  //         ['0', '1', '2', '3', '4']),
                  //     UiDesign.buildRadioLevels(
                  //       'Number of past class failures',
                  //       ['0', '1', '2', '3', '4'],
                  //       GlobalData().numOfFailClass,
                  //       (index) => GlobalData().numOfFailClass = index,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: ,
                    children: [
                      UiDesign.buildTextField2("Number of times absent?",GlobalData().absences.toString(), true, (value) => GlobalData().absences = int.parse(value),),
                      UiDesign.buildTextField2("Semester 1 score?",GlobalData().G1.toString(), true, (value) => GlobalData().G1 = int.parse(value),),
                      UiDesign.buildTextField2("Semester 2 score??",GlobalData().G2.toString(), true, (value) => GlobalData().G2 = int.parse(value),),
                    ],
                  ),
                ],
              ),
            ],
          )
        )
    );
  }
}
