import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';

class FormData5 extends StatefulWidget {

  @override
  _FormData5State createState() => _FormData5State();
}

class _FormData5State extends State<FormData5> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Do you participate in or receive support for the following activities?",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 50),

      _buildLabeledCheckboxRow(
            "School support",
            ['Yes', 'No'],
            GlobalData().schoolSupport,
            (value) {
              setState(() {
                GlobalData().schoolSupport = value;
              });
            },
          ),
        const SizedBox(height: 30),
          _buildLabeledCheckboxRow(
            "Family support",
            ['Yes', 'No'],
            GlobalData().familySupport,
            (value) {
              setState(() {
                GlobalData().familySupport = value;
              });
            },
          ),
        const SizedBox(height: 40),

            _buildLabeledCheckboxRow(
              "Extra paid classes",
              ['Yes', 'No'],
              GlobalData().paidClasses,
              (value) {
                setState(() {
                  GlobalData().paidClasses = value;
                });
              },
            ),
              _buildLabeledCheckboxRow(
              "Extracurricular activities",
              ['Yes', 'No'],
              GlobalData().extracurricularActivities,
              (value) {
                setState(() {
                  GlobalData().extracurricularActivities = value;
                });
              },
            ),
        const SizedBox(height: 40),

        // Navigation Buttons
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
                    GlobalData().indexedStack ++;
                  });
                }
                print( GlobalData().indexedStack);
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
      ]
    );
  }

  // Helper method to build radio button groups
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
