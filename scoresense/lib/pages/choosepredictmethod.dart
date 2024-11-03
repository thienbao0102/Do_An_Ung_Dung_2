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
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Background_OtherPage.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                children: [
                  // Left Panel
                  Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF0071BC),
                        image: DecorationImage(
                            image: AssetImage('Background_Lorem.png'),
                            fit: BoxFit.cover),
                      ),
                      width: MediaQuery.of(context).size.width > 950 ? 400 : 0,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(40),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur efficitur lacus quis maximus.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.circle, color: Colors.white, size: 8),
                              SizedBox(width: 5),
                              Icon(Icons.circle,
                                  color: Colors.white54, size: 8),
                              SizedBox(width: 5),
                              Icon(Icons.circle,
                                  color: Colors.white54, size: 8),
                            ],
                          ),
                        ],
                      )),
                  // Right Panel
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 100,
                            bottom: 40,
                            left: 120,
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const Image(image: AssetImage('star.png')),
                            const SizedBox(height: 20),
                            const Text(
                              'Choose your prediction method',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              width: 350,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF333333)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userChoose = 0;
                                  });
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
                                      color: userChoose == 0
                                          ? const Color(0xFF0062FF)
                                          : Colors.white,
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
                                        decoration: BoxDecoration(
                                          color: userChoose == 0
                                              ? const Color(0xFF0062FF)
                                              : Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFF0062FF),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Căn giữa theo chiều dọc
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // Căn trái
                                            children: const [
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
                            const SizedBox(height: 40),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userChoose = 1;
                                  });
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
                                      color: userChoose == 1
                                          ? const Color(0xFF0062FF)
                                          : Colors.white,
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
                                        decoration: BoxDecoration(
                                          color: userChoose == 1
                                              ? const Color(0xFF0062FF)
                                              : Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFF0062FF),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                          'personal.svg',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.contain,
                                          color: userChoose == 1
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
                            const SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => userChoose == 0
                                          ? const ImportFilePredict()
                                          : const EnterFormData()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 18),
                                backgroundColor: const Color(0xFF0062FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Go',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(top: 40, left: 120, child: Header())
            ],
          ),
        ),
      ),
    );
  }
}
