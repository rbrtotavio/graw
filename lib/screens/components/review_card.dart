import 'package:cinegraw_app/applications/implementation/auth_app.dart';
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
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        review.rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ],
              ),
              Container(
                child: Text(
                  review.review,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
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
