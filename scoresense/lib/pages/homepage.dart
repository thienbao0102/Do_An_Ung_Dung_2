import 'package:flutter/material.dart';
import 'package:scoresense/module/callbackend.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/home_page/activity.dart';
import 'package:scoresense/module/home_page/content_try_predict.dart';
import 'package:scoresense/module/home_page/footer.dart';
import 'package:scoresense/module/home_page/joinus.dart';
import 'package:scoresense/module/home_page/review.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  Future<void> _loadData() async {
    GlobalData().numModel = await getTotalModel();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ContentAndTry(), Activity(), Review(), Joinus(), Footer()],
        ),
      ),
    );
  }
}
