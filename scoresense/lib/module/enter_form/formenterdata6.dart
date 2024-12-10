import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';
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
              ]),
            ],
          )
      )
    );
  }
}
