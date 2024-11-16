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
import 'dart:math';

import 'package:scoresense/pages/personalResultPage.dart';

class EnterFormData extends StatefulWidget {
  const EnterFormData({super.key});

  @override
  _EnterFormDataState createState() => _EnterFormDataState();
}

class _EnterFormDataState extends State<EnterFormData> {
  int indexedStack = 0;
  PageController _pageController = PageController();
  bool _isHovering = false;

  // Hàm chuyển đến trang tiếp theo
  void _nextPage(int pageIndex) {
    setState(() {
      indexedStack = pageIndex;
    });

    // Chuyển thẳng đến trang mới với hiệu ứng mượt mà
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Hàm xây dựng phân trang
  Widget _buildPagination(int pageIndex) {
    bool isSelected = pageIndex == indexedStack;
    return GestureDetector(
      onTap: () => _nextPage(pageIndex),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            '${pageIndex + 1}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        )
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.68,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            left: indexedStack * 48, // Thay đổi vị trí ô màu xanh
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 40, // Chiều rộng ô màu xanh
                              decoration: BoxDecoration(
                                color: GlobalData().colorPrimary,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...List.generate(8, (index) => _buildPagination(index)),
                            ],
                          )
                          
                        ],
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0), // Bo góc nếu cần
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min, // Tự động điều chỉnh chiều cao
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Confirm Finish?',
                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: GlobalData().colorPrimary),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Unanswered questions will be assigned default values, which could impact the accuracy of the prediction.',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: GlobalData().colorText),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed:(){
                                              Navigator.of(context).pop();
                                            }, 
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                              backgroundColor: const Color(0xFF0062FF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: 
                                              const Text(
                                                'Cancel',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                                              )
                                          ),
                                          const SizedBox(width: 30),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => const PersonalResultPage(),
                                                ),
                                              );
                                            },
                                            child: 
                                              MouseRegion(
                                                cursor: SystemMouseCursors.click,
                                                child: 
                                                  Text('OK',
                                                    style: 
                                                      TextStyle(
                                                        fontSize: 16, 
                                                        fontWeight: FontWeight.normal, 
                                                        color: GlobalData().colorPrimary,
                                                      )),
                                              ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovering = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovering = false;
                            });
                          },
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            'Finish',
                            style: TextStyle(
                              color: GlobalData().colorPrimary,
                              fontWeight: FontWeight.normal,
                              decoration: _isHovering ? TextDecoration.underline : TextDecoration.none,
                              decorationColor: _isHovering ? GlobalData().colorPrimary : Colors.transparent,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Hiệu ứng di chuyển ô màu xanh khi chuyển trang
            
            const Positioned(
              top: 40,
              left: 120,
              child: Header(),
            ),
          ],
        )
      ),
    );
  }
}
