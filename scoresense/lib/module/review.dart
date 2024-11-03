import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 100,
            left: MediaQuery.of(context).size.width * 0.18,
            right: MediaQuery.of(context).size.width * 0.18
          ),
          //width: screenWidth > 600 ? screenWidth * 0.68 : screenWidth * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                'SCORESENSE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0062FF),
                ),
              ),
             const Text(
                'Each client is important',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
             const Text(
                'Problems trying to resolve the conflict between the two major realms of Classical physics: Newtonian mechanics',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF737373),
                ),
              ),
              const SizedBox(height:80),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: buildReviewCard(),
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

  Widget buildReviewCard() {
    return Container(
      width: 300 ,
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
            itemSize: 20.0 ,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
         const SizedBox(height: 20),
         const Text(
            'Slate helps you see how many more days you need to work to reach your financial goal for the month and year.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF737373),
            ),
          ),
          SizedBox(height:20),
         const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const  CircleAvatar(
                radius:25 ,
                backgroundImage: AssetImage('linh.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    'Regina Miles',
                    style: TextStyle(
                      fontSize:  14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A9FF),
                    ),
                  ),
                  Text(
                    'Designer',
                    style: TextStyle(
                      fontSize: 12,
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
