import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:cinegraw_app/models/review_page_args.dart';
import 'package:flutter/material.dart';

class ReviewActions extends StatefulWidget {
  const ReviewActions({
    Key? key,
    required this.review,
    required this.updateReviews,
  }) : super(key: key);
  final Review review;
  final void Function() updateReviews;

  @override
  State<ReviewActions> createState() => ReviewActionsState();
}

class ReviewActionsState extends State<ReviewActions> {
  final ProfileApp _profileApp = ProfileApp();
  final FilmsApp _filmsApp = FilmsApp();

  void _gotoReviewPage(BuildContext context) async {
    var args = ReviewPageArgs();
    args.filmId = widget.review.filmId;
    args.filmName = widget.review.filmName;
    args.review = widget.review;
    Navigator.pushNamed(context, '/review_page', arguments: args)
        .whenComplete(() {
      widget.updateReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: _profileApp.getProfile(),
      builder: (context, ssProfile) {
        if (ssProfile.hasData &&
            widget.review.profileId == ssProfile.data!.idProfile) {
          return Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    _gotoReviewPage(context);
                  },
                  icon: const Icon(Icons.edit)),
              IconButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    _profileApp
                        .deleteReview(widget.review.reviewId)
                        .whenComplete(() {
                      widget.updateReviews();
                    });
                  },
                  icon: const Icon(Icons.delete))
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
