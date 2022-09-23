import 'package:cinegraw_app/models/review.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorAppbar,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: colorAppbar),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.movie,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  child: Text(
                    review.review,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
