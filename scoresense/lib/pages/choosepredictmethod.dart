import 'package:flutter/material.dart';
import 'package:scoresense/pages/homepage.dart';
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
      child: Row(
        children: [
          // Left Panel
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0071BC),
                image: DecorationImage(
                    image: AssetImage('Background_Lorem.png'),
                    fit: BoxFit.cover),
              ),
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(40),
              child: Stack(
                children: [
                  Positioned(
                      //top: 40,
                      left: 80,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: const Text(
                            'SCORESENSE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nullam consectetur efficitur\nlacus quis maximus.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: 10),
                          SizedBox(width: 5),
                          Icon(Icons.circle, color: Colors.white54, size: 10),
                          SizedBox(width: 5),
                          Icon(Icons.circle, color: Colors.white54, size: 10),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Right Panel
          Expanded(
            flex: 5,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 100, right: 100),
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
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF333333)),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: userChoose == 0
                                ? const Color(0xFF0062FF)
                                : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 82,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: userChoose == 0
                                ? const Color(0xFF0062FF)
                                : Colors.white,
                            border: Border.all(
                                color: const Color(0xFF0062FF), width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.business,
                              color: userChoose == 0
                                  ? Colors.white
                                  : const Color(0xFF0062FF)),
                        ),
                        title: const Text(
                          'Business',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Upload your data as a CSV file for batch prediction.',
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFF333333)),
                        ),
                        onTap: () {
                          setState(() {
                            userChoose = 0;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: userChoose == 1
                                ? const Color(0xFF0062FF)
                                : Colors.white,
                            width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 82,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: userChoose == 1
                                ? const Color(0xFF0062FF)
                                : Colors.white,
                            border: Border.all(
                                color: const Color(0xFF0062FF), width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.person,
                              color: userChoose == 1
                                  ? Colors.white
                                  : const Color(0xFF0062FF)),
                        ),
                        title: const Text(
                          'Personal',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Enter information to receive predictions.',
                          style:
                              TextStyle(fontSize: 13, color: Color(0xFF333333)),
                        ),
                        onTap: () {
                          setState(() {
                            userChoose = 1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 70),
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
    ));
  }
}
