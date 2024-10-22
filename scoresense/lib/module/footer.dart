import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 250,
            padding: const EdgeInsets.only(top: 60, right: 80, bottom: 60, left: 80),
            child:  const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //column dau tien
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Info",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Carrier",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "We Are Hiring",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Blog",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                //column thu 2
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Legal",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Carrier",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "We Are Hiring",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Blog",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                //column thu 3
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Features",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "Business Maketing",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "User Analytic",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Live Chat",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Unlimited Support",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                //column thu 4
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resources",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "IOS & Android",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Watch A Demo",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Customers",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "API",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                //column thu 5
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get In Touch",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "0364047690",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "..........",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "nguyenbao01022004@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                )
              ],
            )
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.only(left: 185, top: 15, bottom: 15),
            color: const Color(0xFFE9E9E9),
            child: const Row(
              children: [
                Text("Made By ScoreSense All Right Reserved",
                style: TextStyle(fontSize: 14, color: Color(0xFF737373)),),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
