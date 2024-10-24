import 'package:flutter/material.dart';
import 'package:scoresense/module/activity.dart';
import 'package:scoresense/module/content_try_predict.dart';
import 'package:scoresense/module/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentAndTry(),   
              Activity(),          
              Footer()
            ],
          ),
        ),
      );
  }
}