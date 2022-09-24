import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList(
      {Key? key, required this.reviews, required this.isProfileScreen})
      : super(key: key);

  final List<Review> reviews;
  final bool isProfileScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            children: List.generate(
              reviews.length,
              (index) {
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
                                  isProfileScreen
                                      ? reviews[index].filmName
                                      : reviews[index].profileName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    reviews[index].rating.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              reviews[index].review,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
