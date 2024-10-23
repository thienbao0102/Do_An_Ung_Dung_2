import 'package:flutter/material.dart';
import 'package:scoresense/module/formenterdata5.dart';
import 'package:scoresense/pages/homepage.dart';
import 'package:scoresense/pages/predictformdata.dart';
import 'package:scoresense/pages/predictimportfile.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const EnterFormData()
    );
  }
}



