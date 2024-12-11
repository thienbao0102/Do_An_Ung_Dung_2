import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoresense/module/enter_form/formenterdata1.dart';
import 'package:scoresense/module/enter_form/formenterdata2.dart';
import 'package:scoresense/module/enter_form/formenterdata3.dart';
import 'package:scoresense/module/enter_form/formenterdata4.dart';
import 'package:scoresense/module/enter_form/formenterdata5.dart';
import 'package:scoresense/module/enter_form/formenterdata6.dart';
import 'package:scoresense/module/enter_form/formenterdata7.dart';
import 'package:scoresense/module/enter_form/formenterdata8.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/pages/personalResultPage.dart';

class EnterFormData extends StatefulWidget {
  const EnterFormData({super.key});

  @override
  _EnterFormDataState createState() => _EnterFormDataState();
}

class _EnterFormDataState extends State<EnterFormData> {
  int currentPageIndex = 0;
  bool _isHovering = false;
  bool _isDisabled = false;
  bool _isPaginationHovering = false;

  // Kiểm tra điều kiện để cho phép hoặc vô hiệu hoá nút
  void _checkCondition() {
    setState(() {
      _isDisabled = GlobalData().firstName.isEmpty ||
          GlobalData().lastName.isEmpty ||
          GlobalData().age == 0 ||
          GlobalData().school.isEmpty;
    });
  }

  // Hàm chuyển đến trang tiếp theo
  void _nextPage(int pageIndex) {
    setState(() {
      pageIndex >= 0 && pageIndex <= 7
          ? currentPageIndex = pageIndex
          : currentPageIndex = currentPageIndex;
    });
  }

  // Hàm xây dựng phân trang
  Widget _buildPagination(int pageIndex) {
    bool isSelected = pageIndex == currentPageIndex;
    return GestureDetector(
      onTap: _isDisabled ? null : () => _nextPage(pageIndex),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Danh sách các trang
    final pages = [
      FormData1(onNext: () => _nextPage(currentPageIndex + 1),isLastPage: currentPageIndex == 6,),
      FormData2( onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),),
      FormData3(onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),),
      FormData4(onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),),
      FormData5(onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),),
      FormData6(onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),),
      FormData7(onNext: () => _nextPage(currentPageIndex + 1),onPrevious: () => _nextPage(currentPageIndex - 1),isLastPage: false,),
      FormData8(onNext: () => _nextPage(currentPageIndex + 0),onPrevious: () => _nextPage(currentPageIndex - 1),isLastPage: true,),
    ];
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              setColor: GlobalData().colorPrimary,
            ),
           Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: DropdownMenu(
                      width: 150,
                      onSelected: (valueChoose) {
                        setState(() {
                          GlobalData().version = valueChoose!;
                        });
                      },
                      initialSelection: 1,
                      inputDecorationTheme: const InputDecorationTheme(),
                      dropdownMenuEntries: List.generate(
                        GlobalData().numModel - 1,
                        (index) => DropdownMenuEntry(
                          value: index + 1,
                          label: "Model_v${index + 1}",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0.0),
                  width: MediaQuery.of(context).size.width * 1,
                  constraints: const BoxConstraints(minHeight: 500),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: pages[currentPageIndex], // Hiển thị trang hiện tại
                  ),
                ),
                MouseRegion(
                  onEnter: (_) {
                    _checkCondition();
                    setState(() {
                      _isPaginationHovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isPaginationHovering = false;
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (currentPageIndex > 0)
                            Padding(
                              padding: const EdgeInsets.only(right: 98.0),
                              child: TextButton(
                                onPressed: () {
                                  _nextPage(currentPageIndex - 1);
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Color(0xFF0062FF)),
                                  ),
                                ),
                                child: const Text(
                                  'Previous',
                                  style: TextStyle(
                                    color: Color(0xFF0062FF),
                                    letterSpacing: 1.3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          // Invisible sized box for alignment
                          if (currentPageIndex == 0)
                            const SizedBox(width: 241), // Match the width of the "Previous" button),
                          Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                left: currentPageIndex * 48,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 40,
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
                              ),
                            ],
                          ),
                          AbsorbPointer(
                            absorbing: _isDisabled,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Confirm Finish?',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: GlobalData().colorPrimary,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Unanswered questions will be assigned default values, which could impact the accuracy of the prediction.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: GlobalData().colorText,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                                    backgroundColor: const Color(0xFF0062FF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                const SizedBox(width: 30),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PersonalResultPage(),
                                                      ),
                                                    );
                                                  },
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors.click,
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal,
                                                        color: GlobalData().colorPrimary,
                                                      ),
                                                    ),
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
                                    decoration: _isHovering
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    decorationColor: _isHovering
                                        ? GlobalData().colorPrimary
                                        : Colors.transparent,
                                    decorationThickness: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 98),
                            child: ElevatedButton(
                              onPressed: () {
                                if (GlobalData().firstName.isEmpty ||
                                    GlobalData().lastName.isEmpty ||
                                    GlobalData().age == 0 ||
                                    GlobalData().school.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              constraints: const BoxConstraints(maxWidth: 400),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    '11104.png',
                                                    width: 300,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    "Alert!",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: GlobalData().colorText,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    "Please finish at least the questions on Page 1 before continuing!",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: GlobalData().colorText,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  MouseRegion(
                                                    cursor: SystemMouseCursors.click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                                        width: double.infinity,
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          color: const Color(0xFF0062FF),
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                        child: const Text(
                                                          'OK',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            letterSpacing: 1.3,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  if (currentPageIndex == 7) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PersonalResultPage(),
                                      ),
                                    );
                                  } else {
                                    _nextPage(currentPageIndex + 1);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                                backgroundColor: const Color(0xFF0062FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                currentPageIndex == 7 ? 'Submit' : 'Next',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 1.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Material(
                        color: const Color.fromARGB(0, 153, 138, 138),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _isDisabled && _isPaginationHovering
                                ? const Color.fromARGB(255, 233, 49, 49)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            "Please finish at least the questions on Page 1 before continuing!",
                            style: TextStyle(
                                color: _isDisabled && _isPaginationHovering
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ],
        ),
      ),
    );
  }
}
