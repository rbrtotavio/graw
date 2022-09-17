import 'package:cinegraw_app/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireBaseFireStoreRepository {
  bool _configured = false;
  late FirebaseFirestore _db;

  static final FireBaseFireStoreRepository _fireBaseFireStoreRepository =
      FireBaseFireStoreRepository._internal();

  factory FireBaseFireStoreRepository() {
    _fireBaseFireStoreRepository.configure();
    return _fireBaseFireStoreRepository;
  }

  FireBaseFireStoreRepository._internal();

  void configure() {
    if (!_configured) {
      _configured = true;
      _db = FirebaseFirestore.instance;
    }
  }

  Future<List<Review>> getReviewsByFilm(int filmId) async {
    var reviews = await _db
        .collection("Reviews")
        .where("FilmId", isEqualTo: filmId)
        .get()
        .then((value) {
      List<Review> listReviews = <Review>[];
      for (var review in value.docs) {
        listReviews.add(Review.FromJson(review.data(), review.id, filmId));
      }
      return listReviews;
    });
    return reviews;
  }

  void reviewFilm(int filmId, String review, double nota, DateTime dataReview,
      String usuarioId, String reviewId) async {
    var userReview = <String, dynamic>{
      "DataReview": dataReview,
      "Nota": nota,
      "Review": review,
      "UsuarioId": usuarioId,
      "FilmId": filmId
    };

    _db
        .collection("Reviews")
        .doc(reviewId)
        .set(userReview)
        .onError((error, stackTrace) {
      print(error);
    });
  }
}
