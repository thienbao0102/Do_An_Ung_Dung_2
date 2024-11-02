import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: Colors.white,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: screenWidth > 600 ? 100 : 50,
            bottom: screenWidth > 600 ? 200 : 100,
          ),
          width: screenWidth > 600 ? screenWidth * 0.68 : screenWidth * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SCORESENSE',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 14 : 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0062FF),
                ),
              ),
              Text(
                'Each client is important',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 40 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Problems trying to resolve the conflict between the two major realms of Classical physics: Newtonian mechanics',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 14 : 12,
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: screenWidth > 600 ? 80 : 40),
              SizedBox(
                height: screenWidth > 600 ? 300 : 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: buildReviewCard(screenWidth),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReviewCard(double screenWidth) {
    return Container(
      width: screenWidth > 600 ? 300 : 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 251, 252, 252),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(4, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            initialRating: 4.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: screenWidth > 600 ? 20.0 : 15.0,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: screenWidth > 600 ? 20 : 10),
          Text(
            'Slate helps you see how many more days you need to work to reach your financial goal for the month and year.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth > 600 ? 16 : 12,
              fontWeight: FontWeight.normal,
              color: Color(0xFF737373),
            ),
          ),
          SizedBox(height: screenWidth > 600 ? 20 : 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth > 600 ? 25 : 20,
                backgroundImage: AssetImage('linh.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Regina Miles',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 14 : 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A9FF),
                    ),
                  ),
                  Text(
                    'Designer',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 12 : 10,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF252B42),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
