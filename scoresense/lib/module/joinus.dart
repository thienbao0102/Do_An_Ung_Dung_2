import 'package:flutter/material.dart';

class Joinus extends StatelessWidget {
  const Joinus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFCDF5FD),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 100, bottom: 100),
            width: MediaQuery.of(context).size.width * 0.68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Newsletter',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0062FF),
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'JOIN US',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252B42),
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Problems trying to resolve the conflict between\nthe two major realms of Classical physics: Newtonian mechanics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF737373),
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50, // Đặt chiều cao cho khung "Your Email"
                        width: 450, // Điều chỉnh chiều rộng ở đây
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 0.5), // Khoảng cách giữa hai khung
                      Container(
                        height: 48, // Đặt cùng chiều cao với khung "Your Email"
                        child: OutlinedButton(
                          onPressed: () {
                            // Implement "Subscribe" functionality here
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 18), // Đặt padding cho nút
                            side: const BorderSide(color: Color(0xFF0062FF)),
                            backgroundColor: Color(0xFF0062FF),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Subscribe',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}