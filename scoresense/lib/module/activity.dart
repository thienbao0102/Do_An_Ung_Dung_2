import 'package:flutter/material.dart';
import 'package:scoresense/pages/predictformdata.dart';
import 'package:scoresense/pages/predictimportfile.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 200, bottom: 200),
            width: MediaQuery.of(context).size.width * 0.68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SCORESENSE',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0062FF)),
                ),
                const Text(
                  'Our Activity',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Predict the pass or fail likelihood of students based on the analysis of academic data and related factors.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF737373)),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterFormData()),
                          );
                        },
                        child: Container(
                          width: 510,
                          height: 270,
                          color: const Color(0xFFCDF5FD),
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(image: AssetImage('Individual.png')),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Individual',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2,
                                width: 50,
                                color: const Color(0xFF0062FF),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              const SizedBox(
                                height: 40,
                                width: 250,
                                child: Text(
                                  'Analyze personal data to predict pass/fail outcomes.',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF737373)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ImportFilePredict()),
                          );
                        },
                        child: Container(
                          width: 510,
                          height: 270,
                          color: const Color(0xFFCDF5FD),
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(image: AssetImage('public.png')),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Public',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2,
                                width: 50,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                color: const Color(0xFF0062FF),
                              ),
                              const SizedBox(
                                height: 40,
                                width: 250,
                                child: Text(
                                  'Analyze collective data to predict overall pass/fail outcomes.',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF737373)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
