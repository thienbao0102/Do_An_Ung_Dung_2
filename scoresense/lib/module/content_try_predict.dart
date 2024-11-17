import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/choosepredictmethod.dart';

class ContentAndTry extends StatefulWidget {
  const ContentAndTry({super.key});

  @override
  State<ContentAndTry> createState() => _ContentAndTryState();
}

class _ContentAndTryState extends State<ContentAndTry> {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height * 0.5;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 0, bottom: 160),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('3214599-2.png'),
          fit: BoxFit.fitWidth,
        ),
      ),

      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: Header(setColor: Colors.white,),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35, left: 100),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSection(),
                SizedBox(height: 40),
                ActionButtons(),
                // SizedBox(
                //   height: 100,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'ScoreSense:',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
            ),
            maxLines: 2,
          ),
          AutoSizeText(
            'Predict. Prepare. Succeed!',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          AutoSizeText(
            'Achieve Your Best Grades with Smart Predictions',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:  20.0),
      child: Wrap(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // chinh border
              ),
              elevation: 3,  // Điều chỉnh giá trị này để thay đổi độ cao của bóng
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Choosepredictmethod()),
              );
            },
            child: const Text(
              'Start Now',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color:  Color.fromARGB(255, 9, 5, 43)),
            ),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // chinh border
              ),
              elevation: 5,  // Điều chỉnh giá trị này để thay đổi độ cao của bóng
            ),
            onPressed: () {},
            child: const Text(
              'See More',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
