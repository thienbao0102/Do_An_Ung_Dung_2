import 'package:flutter/material.dart';
import 'package:scoresense/module/formenterdata1.dart';
import 'package:scoresense/module/formenterdata2.dart';
import 'package:scoresense/module/formenterdata3.dart';
import 'package:scoresense/module/formenterdata4.dart';
import 'package:scoresense/module/formenterdata5.dart';
import 'package:scoresense/module/formenterdata6.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/homepage.dart';

class EnterFormData extends StatefulWidget {
  const EnterFormData({super.key});

  @override
  _EnterFormDataState createState() => _EnterFormDataState();
}

class _EnterFormDataState extends State<EnterFormData> {
  int indexedStack = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Background_OtherPage.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                const Positioned(
                  top: 40,
                  left: 120,
                  child: Header(),
                ),
                Center(
                  child: Container(
                      width: 1040,
                      height: 600,
                      margin: const EdgeInsets.only(top: 70),
                      padding: const EdgeInsets.only(left: 80, right: 80),
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
                      ),
                      child: Stack(
                        children: [
                          ValueListenableBuilder<int>(
                            valueListenable: GlobalData()
                                .indexedStackNotifier, // Lắng nghe thay đổi
                            builder: (context, indexedStack, child) {
                              return IndexedStack(
                                index:
                                    indexedStack, // Sử dụng giá trị từ ValueNotifier
                                children: [
                                  FormData1(),
                                  FormData2(),
                                  FormData3(),
                                  FormData4(),
                                  FormData5(),
                                  FormData6()
                                ],
                              );
                            },
                          ),
                          Positioned(
                            bottom: 30,
                            left: 0,
                            right: 0,
                            child:
                                // Navigation Buttons
                                Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (GlobalData()
                                            .indexedStackNotifier
                                            .value >
                                        0) {
                                      GlobalData().indexedStackNotifier.value--;
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          color: Color(0xFF0062FF)),
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
                                    if (GlobalData()
                                            .indexedStackNotifier
                                            .value <
                                        7) {
                                      GlobalData().indexedStackNotifier.value++;
                                    }
                                    print("value" + GlobalData().firstName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 15),
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
                          )
                        ],
                      )),
                ),
              ],
            )));
  }
}
