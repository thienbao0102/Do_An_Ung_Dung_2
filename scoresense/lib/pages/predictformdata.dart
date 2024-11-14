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

  void _nextPage(int pageIndex) {
    setState(() {
      indexedStack = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildPageNumber(int pageIndex) {
    bool isSelected = pageIndex == indexedStack;
    return GestureDetector(
      onTap: () => _nextPage(pageIndex),
      child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF0062FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(6.0),
      ),
        child: Text(
          '${pageIndex + 1}',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FormData1(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1), isLastPage: indexedStack == 6),
                        FormData2(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1)),
                        FormData3(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1)),
                        FormData4(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1)),
                        FormData5(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1)),
                        FormData6(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1)),
                        FormData7(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1), isLastPage: false),
                        FormData8(onNext: () => _nextPage(indexedStack + 1), onPrevious: () => _nextPage(indexedStack - 1), isLastPage: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Thêm phân trang ở đây
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(8, (index) => _buildPageNumber(index)),
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
