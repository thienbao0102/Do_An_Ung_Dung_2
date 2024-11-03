import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('backgound_homepage.png'),
              fit: BoxFit.cover)),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 100, bottom: 160),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const Positioned(
            top: 40,
            left: 20,
            child: Header(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 350),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSection(),
                SizedBox(height: 40),
                ActionButtons(),
                SizedBox(height: 100,)  
              ],
            ),
          )
        ],
      ));
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0062FF),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // chinh border
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Choosepredictmethod()),
              );
            },
            child: const Text(
              'Start Your Test Now',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              side: const BorderSide(color: Color(0xFF0062FF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // chinh border
              ),
            ),
            onPressed: () {
            },
            child: const Text(
              'See More',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0062FF)),
            ),
          ),
        ],
      ),
    );
  }
}
