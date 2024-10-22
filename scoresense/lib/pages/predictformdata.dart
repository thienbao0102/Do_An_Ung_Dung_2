import 'package:flutter/material.dart';
import 'package:scoresense/module/formenterdata1.dart';
import 'package:scoresense/module/formenterdata2.dart';
import 'package:scoresense/module/formenterdata3.dart';
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
        child:  Stack(
          children: [
            const Positioned(
              top: 40,
              left: 120,
              child: Header(),
            ),
            Center(
              child: Container(
                  width: 1040,
                  height: 520,
                  padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
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
                  child:  IndexedStack(
                    index: GlobalData().indexedStack,
                    children: [
                      FormData1(),
                      FormData2(),
                      FormData3()
                    ],
                  )
                ),
            ),
          ],
        )
      )
    );
  }
}
