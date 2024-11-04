import 'package:flutter/material.dart';
import 'package:scoresense/module/formenterdata1.dart';
import 'package:scoresense/module/formenterdata2.dart';
import 'package:scoresense/module/formenterdata3.dart';
import 'package:scoresense/module/formenterdata4.dart';
import 'package:scoresense/module/formenterdata5.dart';
import 'package:scoresense/module/formenterdata6.dart';
import 'package:scoresense/module/formenterdata7.dart';
import 'package:scoresense/module/formenterdata8.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';

class EnterFormData extends StatefulWidget {
  const EnterFormData({super.key});

  @override
  _EnterFormDataState createState() => _EnterFormDataState();
}

class _EnterFormDataState extends State<EnterFormData> {
  late PageController _pageController;
  int indexedStack = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: indexedStack);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (indexedStack < 7) {
      setState(() {
        indexedStack++;
      });
      _pageController.animateToPage(
        indexedStack,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (indexedStack > 0) {
      setState(() {
        indexedStack--;
      });
      _pageController.animateToPage(
        indexedStack,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Background_OtherPage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FormData1(onNext: _nextPage, onPrevious: _previousPage, isLastPage: indexedStack == 6),
                        FormData2(onNext: _nextPage, onPrevious: _previousPage),
                        FormData3(onNext: _nextPage, onPrevious: _previousPage),
                        FormData4(onNext: _nextPage, onPrevious: _previousPage),
                        FormData5(onNext: _nextPage, onPrevious: _previousPage),
                        FormData6(onNext: _nextPage, onPrevious: _previousPage),
                        FormData7(onNext: _nextPage, onPrevious: _previousPage, isLastPage: false),
                        FormData8(onNext: _nextPage, onPrevious: _previousPage, isLastPage: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 40,
              left: 120,
              child: Header(),
            ),
          ],
        ),
      ),
    );
  }
}
