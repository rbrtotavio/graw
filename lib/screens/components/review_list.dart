import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/screens/components/review_actions.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key, required this.isProfileScreen, this.filmId})
      : super(key: key);

  final bool isProfileScreen;
  final int? filmId;

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  final ProfileApp _profileApp = ProfileApp();
  final FilmsApp _filmsApp = FilmsApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Review>>(
      future: widget.isProfileScreen
          ? _profileApp.getUserReviews()
          : _filmsApp.getFilmReviews(widget.filmId!),
      builder: (context, ssReviews) {
        if (ssReviews.hasError) {
          print(ssReviews.error);
        }
        if (ssReviews.hasData && ssReviews.data!.isNotEmpty) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    ssReviews.data!.length,
                    (index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: colorAppbar,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: colorAppbar),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ssReviews.data![index].reviewDate
                                          .toString(),
                                      style: TextStyle(color: colorBG),
                                    ),
                                    ReviewActions(
                                      review: ssReviews.data![index],
                                      updateReviews: () => setState(() {}),
                                    )
                                  ],
                                ),
                                const Divider(
                                  color: colorBG,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        widget.isProfileScreen
                                            ? ssReviews.data![index].filmName
                                            : ssReviews
                                                .data![index].profileName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ssReviews.data![index].rating
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  ssReviews.data![index].review,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: widget.isProfileScreen
              ? const Text("Faça uma review e ela aparecá aqui :)")
              : const Text("Esse filme ainda não possui uma review :("),
        );
      },
    );
  }
}
