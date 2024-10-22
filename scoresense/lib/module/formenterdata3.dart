import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';

class FormData3 extends StatefulWidget {
  @override
  _FormData3State createState() => _FormData3State();
}

class _FormData3State extends State<FormData3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Your daily',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(height: 20),
        buildQuestion(
          'Free time after school',
          ['Very low', 'Low', 'Normal', 'High', 'Very high'],
          GlobalData().freeTimeIndex,
          (index) {
            setState(() {
              GlobalData().freeTimeIndex = index;
            });
          },
        ),
        buildQuestion(
          'Home to school travel time',
          ['< 15"', '15" to 30"', '30" to 1 hour', '> 1 hour'],
          GlobalData().travelTimeIndex,
          (index) {
            setState(() {
              GlobalData().travelTimeIndex = index;
            });
          },
        ),
        buildQuestion(
          'Go out with friends',
          ['Very rarely', 'Rarely', 'Sometimes', 'Often', 'Very often'],
          GlobalData().goOutIndex,
          (index) {
            setState(() {
              GlobalData().goOutIndex = index;
            });
          },
        ),
        const SizedBox(height: 20),
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
                      GlobalData().indexedStack = GlobalData().indexedStack + 1;
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
      ],
    );
  }

  Widget buildQuestion(String question, List<String> options, int selectedIndex,
      ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 250,
            ),
            Container(
              width: options.length * 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  return SizedBox(
                    width: 95,
                    child: Text(
                      options[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 250,
              child: Text(
                question,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: options.length * 100,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF0062FF)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 90,
                        child: Radio<int>(
                          value: index,
                          groupValue: selectedIndex,
                          onChanged: (int? value) {
                            if (value != null) {
                              onChanged(value);
                            }
                          },
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
        //const Divider(thickness: 1),
        const SizedBox(height: 30),
      ],
    );
  }
}
