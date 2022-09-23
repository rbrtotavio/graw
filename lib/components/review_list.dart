import 'package:cinegraw_app/components/review_card.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 300,
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(reviews.length,
                    (index) => ReviewCard(review: reviews[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
