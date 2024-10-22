import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';

class FormData1 extends StatefulWidget {
  //const FormData1({Key? key}) : super(key: key);

  @override
  _FormData1State createState() => _FormData1State();
}

class _FormData1State extends State<FormData1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Give me your information",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0062FF),
          ),
        ),
        const SizedBox(height: 50),

        // First Name & Last Name Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextField(
              "Your First name",
              'firstName',
              (value) {
                setState(() {
                  GlobalData().firstName = value;
                });
              },
            ),
            _buildTextField(
              "Your Last name",
              'lastName',
              (value) {
                setState(() {
                  GlobalData().lastName = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Gender and Location Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRadioButtonGroup(
              "Gender?",
              ['Male', 'Female'],
              GlobalData().gender,
              (value) {
                setState(() {
                  GlobalData().gender = value;
                });
              },
            ),
            _buildRadioButtonGroup(
              "Home location?",
              ['Urban', 'Rural'],
              GlobalData().location,
              (value) {
                setState(() {
                  GlobalData().location = value;
                });
              },
            ),
            _buildTextField(
              "Your age?",
              'age',
              (value) {
                setState(() {
                  GlobalData().age = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 30),

        // School Name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextField(
              "What school are you in?",
              'school',
              (value) {
                setState(() {
                  GlobalData().school = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 50),

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
      ],
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(
      String label, String value, Function(String) onChanged) {
    return SizedBox(
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle:
                  const TextStyle(color: Color(0xFF0062FF), fontSize: 16),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0062FF),width: 2.0),
              ),
            ),
            onChanged: (val) => onChanged(val),
          )
        ],
      ),
    );
  }

  // Helper method to build radio button groups
  Widget _buildRadioButtonGroup(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0062FF),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    onTap: () => {onChanged(option)},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
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
                          color: selectedValue == option
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
