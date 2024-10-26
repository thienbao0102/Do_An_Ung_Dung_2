import 'package:flutter/material.dart';
import 'package:scoresense/module/formenterdata1.dart';
import 'package:scoresense/module/formenterdata2.dart';
import 'package:scoresense/module/formenterdata3.dart';
import 'package:scoresense/module/formenterdata4.dart';
import 'package:scoresense/module/formenterdata5.dart';
import 'package:scoresense/module/formenterdata6.dart';
import 'package:scoresense/module/formenterdata7.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';

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
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Background_OtherPage.png'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Stack(
              children: [       
                Center(
                  child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1000.0, // Chiều rộng tối đa là 1000
                      ),
                      width: MediaQuery.of(context).size.width * 0.6, // 70% chiều rộng màn hình
                      margin: const EdgeInsets.only(top: 70),
                      padding: const EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 40),
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
                            valueListenable: GlobalData().indexedStackNotifier,
                            builder: (context, indexedStack, child) {
                              return IndexedStack(
                                index: indexedStack,
                                children: [
                                  FormData1(),
                                  FormData2(),
                                  FormData3(),
                                  const FormData4(),
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
                                if(GlobalData().indexedStackNotifier.value == 0)
                                const SizedBox(),
                                if(GlobalData().indexedStackNotifier.value != 0)
                                TextButton(
                                  onPressed: () {
                                    if (GlobalData()
                                            .indexedStackNotifier
                                            .value >
                                        0) {
                                      setState(() {
                                        GlobalData().indexedStackNotifier.value--;
                                      });
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
                                      setState(() {
                                        GlobalData().indexedStackNotifier.value++;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 15),
                                    backgroundColor: const Color(0xFF0062FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    GlobalData().indexedStackNotifier.value == 6? 'Submit':'Next',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      ),
                ),
                const Positioned(
                  top: 40,
                  left: 120,
                  child: Header(),
                ),
              ],
            ),
            )));
  }
  
}
