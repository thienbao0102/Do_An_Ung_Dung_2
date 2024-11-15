import 'package:flutter/material.dart';
import 'package:scoresense/pages/choosepredictmethod.dart';
import 'package:scoresense/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Sense',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const Choosepredictmethod()
    );
  }
}



