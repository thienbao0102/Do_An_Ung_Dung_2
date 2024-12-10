import 'package:flutter/material.dart';

class Joinus extends StatelessWidget {
  const Joinus({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth,
        color: const Color(0xFFCDF5FD),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(
              top: screenWidth > 600 ? 100 : 50,
              bottom: screenWidth > 600 ? 100 : 50,
            ),
            width: screenWidth > 600 ? screenWidth * 0.68 : screenWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Newsletter',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 14 : 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0062FF),
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'JOIN US',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 40 : 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF252B42),
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Problems trying to resolve the conflict between\nthe two major realms of Classical physics: Newtonian mechanics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 14 : 12,
                    color: const Color(0xFF737373),
                  ),
                ),
                const SizedBox(height:40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? 10.0 : 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth > 1000 ? 500 : 95,
                        child: Container(
                          height: 50,
                          child:const TextField(
                            decoration: InputDecoration(
                              hintText: 'Your Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                                borderSide: BorderSide.none,
                                ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 0.5),
                      // Fixed width for the button
                      Container(
                        height: 50,
                        width: screenWidth > 600 ? 110 : 90, // Adjusted width for small screens
                        child: OutlinedButton(
                          onPressed: () {
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            side: const BorderSide(color: Color(0xFF0062FF)),
                            backgroundColor: const Color(0xFF0062FF),
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