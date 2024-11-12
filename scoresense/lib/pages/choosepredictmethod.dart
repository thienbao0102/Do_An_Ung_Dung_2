import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Background_OtherPage.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 170,
                            bottom: 40,
                            left: MediaQuery.of(context).size.width >= 500
                                ? 120
                                : 50,
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(image: AssetImage('star.png')),
                            const SizedBox(height: 30),
                            const Text(
                              'Choose your prediction method',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EnterFormData()),
                                  );
                                },
                                child: Container(
                                  constraints:
                                      const BoxConstraints(minWidth: 350),
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFF0062FF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  height: 82,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 60,
                                        width: 60,
                                        child: SvgPicture.asset(
                                          'personal.svg',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.contain,
                                          color: const Color(0xFF0062FF),
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa theo chiều dọc
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // Căn trái
                                            children: [
                                              Text(
                                                'Personal',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Enter information to receive predictions.',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFF333333)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
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
                                  constraints:
                                      const BoxConstraints(minWidth: 350),
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFF0062FF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  height: 82,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 60,
                                        width: 60,
                                        child: SvgPicture.asset(
                                          'business.svg',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.contain,
                                          color: userChoose == 0
                                              ? Colors.white
                                              : const Color(0xFF0062FF),
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa theo chiều dọc
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // Căn trái
                                            children: [
                                              Text(
                                                'Business',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Upload your data as a CSV file for batch prediction.',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFF333333)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 40,
                  left: MediaQuery.of(context).size.width >= 500 ? 120 : 50,
                  child: Header()),
            ],
          ),
        ),
      ),
    );
  }
}
