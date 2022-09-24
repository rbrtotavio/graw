import 'package:cinegraw_app/applications/implementation/films_app.dart';
import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  ReviewList({Key? key, required this.isProfileScreen, this.filmId})
      : super(key: key);

  final bool isProfileScreen;
  final ProfileApp _profileApp = ProfileApp();
  final FilmsApp _filmsApp = FilmsApp();
  final int? filmId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Review>>(
      future: isProfileScreen
          ? _profileApp.getUserReviews()
          : _filmsApp.getFilmReviews(filmId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    snapshot.data!.length,
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
                                      snapshot.data![index].reviewDate
                                          .toString(),
                                      style: TextStyle(color: colorBG),
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            padding: const EdgeInsets.all(8.0),
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            padding: const EdgeInsets.all(8.0),
                                            onPressed: () {
                                              _profileApp.deleteReview(snapshot
                                                  .data![index].reviewId);
                                            },
                                            icon: const Icon(Icons.delete))
                                      ],
                                    ),
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
                                        isProfileScreen
                                            ? snapshot.data![index].filmName
                                            : snapshot.data![index].profileName,
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
                                              snapshot.data![index].rating
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
                                  snapshot.data![index].review,
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
          child: isProfileScreen
              ? const Text("Faça uma review e ela aparecá aqui :)")
              : const Text("Esse filme ainda não possui uma review :("),
        );
      },
    );
  }
}
