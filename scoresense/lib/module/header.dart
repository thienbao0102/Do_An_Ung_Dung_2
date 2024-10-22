import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SCORESENSE", 
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none)),
        Text(
          "Predict. Prepare. Succeed.",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal ,color: Colors.black, decoration: TextDecoration.none),
        )
      ],
    );
  }
}
