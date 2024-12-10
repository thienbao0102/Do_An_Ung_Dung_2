import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoresense/module/global_variable.dart';

class StarRating extends StatefulWidget {
  // final List<String> labels; // Thêm tham số labels
  final String question;
  const StarRating({super.key, required this.question});

  @override
  // ignore: library_private_types_in_public_api
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                widget.question,
                style: TextStyle(fontSize: 16, color: GlobalData().colorText),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: GlobalData().colorPrimary),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.basic, // Bỏ hiệu ứng hover
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                index < _rating ? 'assets/star-filled.svg' : 'assets/star-bordered.svg',
                                color: GlobalData().colorPrimary,
                                width: 30,
                                height: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _rating = index + 1;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -15, // Di chuyển lên trên một chút
                  right: 25, // Hoặc bạn có thể thay đổi thành left nếu muốn lệch sang trái
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: GlobalData().colorPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: 
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Để Row chỉ chiếm không gian cần thiết
                          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung trong Row
                          children: [
                            SizedBox(
                              width: 10,
                              child: Text(
                                '$_rating',
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/star-filled.svg',
                              // ignore: deprecated_member_use
                              color: Colors.white,
                              width: 15,
                              height: 15,
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}