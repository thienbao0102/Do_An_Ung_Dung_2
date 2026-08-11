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
  String? _errorMessage;

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      GlobalData().numModel = await getTotalModel();
    } catch (_) {
      _errorMessage =
          'Unable to connect to ScoreSense. The free server may be starting; please try again.';
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_errorMessage!, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _loadData,
                  child: const Text('Try again'),
                ),
              ],
            ),
          ),
        ),
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
