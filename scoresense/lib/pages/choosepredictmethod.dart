import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/predictformdata.dart';
import 'package:scoresense/pages/predictimportfile.dart';

class Choosepredictmethod extends StatefulWidget {
  const Choosepredictmethod({super.key});

  @override
  State<Choosepredictmethod> createState() => _ChoosepredictmethodState();
}

class _ChoosepredictmethodState extends State<Choosepredictmethod> {
  int userChoose = 1;

  void navigateToNextScreen() {
    if (userChoose == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EnterFormData()),
      );
    } else if (userChoose == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ImportFilePredict()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Background_OtherPage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 150,
                          bottom: 40,
                          left: MediaQuery.of(context).size.width >= 500 ? 100 : 40,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose your prediction method',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: GlobalData().colorText,
                              ),
                            ),
                            const SizedBox(height: 70),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userChoose = 1;
                                });
                              },
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 350),
                                width: MediaQuery.of(context).size.width * 0.35,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: userChoose == 2 ? Colors.white : const Color(0xFF0062FF),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(right: 20),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: userChoose == 1 ? const Color(0xFF0062FF) : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: const Color(0xFF0062FF),
                                          width: 2,
                                        ),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: SvgPicture.asset(
                                            'person-outline.svg',
                                            fit: BoxFit.contain,
                                            color: userChoose == 1 ? Colors.white : const Color(0xFF0062FF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Personal Input',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Enter data manually for a single prediction.',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userChoose = 2;
                                });
                              },
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 350),
                                width: MediaQuery.of(context).size.width * 0.35,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: userChoose == 1 ? Colors.white : const Color(0xFF0062FF),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      padding: EdgeInsets.all(8),
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: userChoose == 2 ? const Color(0xFF0062FF) : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: const Color(0xFF0062FF),
                                          width: 2,
                                        ),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: SvgPicture.asset(
                                            'business-outline.svg',
                                            fit: BoxFit.contain,
                                            color: userChoose == 2 ? Colors.white : const Color(0xFF0062FF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'CSV Upload',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Upload your data as a CSV file for batch prediction.',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: navigateToNextScreen,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0062FF),
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Next Step',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: MediaQuery.of(context).size.width >= 500 ? 100 : 40,
                child: Header(),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                right: 0, // Giá trị động để hiệu ứng trượt
                bottom: -100,
                child: Image.asset(
                  userChoose == 1 ? '5214641.png' : '2808347.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.contain, // Đảm bảo hình ảnh phù hợp với vùng
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
