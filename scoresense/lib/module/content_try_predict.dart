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
          Positioned(
            right: 40,
            bottom: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                ),
              child: 
              Image.asset(
                    '3214599.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.contain, // Đảm bảo hình ảnh phù hợp với vùng
                  ),
              ),
            ),
          Container(
            padding: const EdgeInsets.only(top: 350, left: 100),
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
            'Achieve Your Best Grades\nwith Smart Predictions',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            maxFontSize: 40,
            minFontSize: 20,
          ),
          SizedBox(height: 10),
          AutoSizeText(
            'Unlock insights into your academic performance\nand stay ahead with accurate score forecasts.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
            maxLines: 2,
            maxFontSize: 20,
            minFontSize: 13,
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
