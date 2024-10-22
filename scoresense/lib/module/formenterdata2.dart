import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';

class FormData2 extends StatefulWidget {
  // const FormData2({
  //   super.key,
  // });

  @override
  State<FormData2> createState() => _FormData2State();
}

class _FormData2State extends State<FormData2> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Your parents information",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0062FF)),
          ),
          const SizedBox(height: 20),

          // Father's Education
          _buildLabeledCheckboxRow(
            "Father's education",
            [
              'None',
              'Primary',
              '5th to 9th grade',
              'Secondary',
              'Higher education'
            ],
            GlobalData().fatherEducation,
            (value) {
              setState(() {
                GlobalData().fatherEducation = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Mother's Education
          _buildLabeledCheckboxRow(
            "Mother's education",
            [
              'None',
              'Primary',
              '5th to 9th grade',
              'Secondary',
              'Higher education'
            ],
            GlobalData().motherEducation,
            (value) {
              setState(() {
                GlobalData().motherEducation = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Mother's Job
          _buildLabeledCheckboxRow(
            "Mother's job",
            ['At home', 'Health', 'Services', 'Teacher', 'Other'],
            GlobalData().motherJob,
            (value) {
              setState(() {
                GlobalData().motherJob = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Father's Job
          _buildLabeledCheckboxRow(
            "Father's job",
            ['At home', 'Health', 'Services', 'Teacher', 'Other'],
            GlobalData().fatherJob,
            (value) {
              setState(() {
                GlobalData().fatherJob = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Parent Status
          _buildLabeledCheckboxRow(
            "Parent status",
            ['Apart', 'Together'],
            GlobalData().parentStatus,
            (value) {
              setState(() {
                GlobalData().parentStatus = value;
              });
            },
          ),
          const SizedBox(height: 40),

          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (GlobalData().indexedStack >= 0) {
                    setState(() {
                      GlobalData().indexedStack = GlobalData().indexedStack - 1;
                    });
                  }
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xFF0062FF)),
                  ),
                ),
                child: const Text(
                  'Previous',
                  style: TextStyle(
                      color: Color(0xFF0062FF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (GlobalData().indexedStack < 7) {
                    setState(() {
                      GlobalData().indexedStack =GlobalData().indexedStack + 1;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  backgroundColor: const Color(0xFF0062FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ]);
  }

// Build a row of custom square checkboxes with a label
  Widget _buildLabeledCheckboxRow(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 180,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0062FF)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            spacing: 10,
            children: options.map((option) {
              return GestureDetector(
                onTap: () {
                  onChanged(option);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedValue == option
                        ? const Color(0xFF0062FF)
                        : Colors.transparent,
                    // border: Border.all(color: const Color(0xFF0062FF)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      color:
                          selectedValue == option ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
