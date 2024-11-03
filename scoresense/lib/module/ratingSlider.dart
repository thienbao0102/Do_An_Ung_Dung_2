import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoresense/module/global_variable.dart';

class RatingSlider extends StatefulWidget {
  final List<String> labels; // Thêm tham số labels
  final String question;
  const RatingSlider(
      {super.key,
      required this.question,
      required this.labels}); // Cập nhật constructor

  @override
  // ignore: library_private_types_in_public_api
  _RatingSliderState createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildRatingSlider() {
    return SizedBox( //chuyển column thành sizebox or container
      width: double.infinity,//thêm dòng này vô để nó lấy chiều dài bằng với chiều dài của container cha
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,//dòng này để căn giữa text nằm giữa với column thứ 2
        children: [
          Column(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                    widget.question,
                    style:
                        TextStyle(fontSize: 16, color: GlobalData().colorText),
                  ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/chevron-back-outline.svg',
                      // ignore: deprecated_member_use
                      color: GlobalData().colorPrimary,
                      width: 30,
                      height: 30,
                    ),
                    onPressed: _previousValue,
                  ),
                  SizedBox(
                    width: 160,
                    height: 30,
                    child: Center(
                        child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.labels.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex =
                              index; // Cập nhật currentIndex khi người dùng vuốt
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            widget
                                .labels[index], // Sử dụng widget.labels[index]
                            style: TextStyle(
                              fontSize: 16,
                              color: GlobalData().colorText,
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/chevron-forward-outline.svg',
                      // ignore: deprecated_member_use
                      color: GlobalData().colorPrimary,
                      width: 30,
                      height: 30,
                    ),
                    onPressed: _nextValue,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.labels.length, (index) {
                  // Sử dụng widget.labels.length
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? GlobalData().colorPrimary
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 4,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _nextValue() {
    if (currentIndex < widget.labels.length - 1) {
      setState(() {
        currentIndex++;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      });
    }
  }

  void _previousValue() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildRatingSlider(); // Không cần truyền tham số nữa
  }
}
