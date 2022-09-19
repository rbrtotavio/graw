import 'package:cinegraw_app/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        listReviews.add(Review.FromJson(review.data(), review.id));
      }
      return listReviews;
    });
    return reviews;
  }

  Future<List<Review>> getReviewsByUser(String userId) async {
    var reviews = await _db
        .collection("Reviews")
        .where("UserId", isEqualTo: userId)
        .get()
        .then((value) {
      List<Review> listReviews = <Review>[];
      for (var review in value.docs) {
        listReviews.add(Review.FromJson(review.data(), review.id));
      }
      return listReviews;
    });
    return reviews;
  }

  Future<Review?> getReviewById(String reviewId) async {
    var review = await _db.collection("Reviews").doc(reviewId).get();
    if (review.exists) {
      return Review.FromJson(review.data()!, reviewId);
    }

    return null;
  }

  Future<String> reviewFilm(int filmId, String review, double nota,
      DateTime dataReview, String usuarioId, String reviewId) async {
    var userReview = <String, dynamic>{
      "DataReview": dataReview,
      "Nota": nota,
      "Review": review,
      "UsuarioId": usuarioId,
      "FilmId": filmId
    };

    return _db
        .collection("Reviews")
        .doc(reviewId)
        .set(userReview)
        .then((value) => "", onError: (error) => error.toString());
  }

  Future<String> deleteReview(String reviewId) async {
    var review = await getReviewById(reviewId);
    if (review == null) {
      return "";
    }

    return _db
        .collection("Reviews")
        .doc(reviewId)
        .delete()
        .then((value) => "", onError: (error) => error.toString());
  }
}
