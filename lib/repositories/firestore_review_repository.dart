import 'package:cinegraw_app/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreReviewRepository {
  bool _configured = false;
  late CollectionReference _db;

  static final FirestoreReviewRepository _firestoreReviewRepository =
      FirestoreReviewRepository._internal();

  factory FirestoreReviewRepository() {
    _firestoreReviewRepository.configure();
    return _firestoreReviewRepository;
  }

  FirestoreReviewRepository._internal();

  void configure() {
    if (!_configured) {
      _configured = true;
      _db = FirebaseFirestore.instance.collection("Reviews");
    }
  }

  Future<List<Review>> getReviewsByFilm(int filmId) async {
    QuerySnapshot reviewsQuery =
        await _db.where("FilmId", isEqualTo: filmId).get();
    List<Review> reviews = reviewsQuery.docs
        .map((r) => Review.FromJson(r.data() as Map<String, dynamic>, r.id))
        .toList();

    return reviews;
  }

  Future<List<Review>> getReviewsByUser(String profileId) async {
    QuerySnapshot reviewsQuery =
        await _db.where("ProfileId", isEqualTo: profileId).get();
    List<Review> reviews = reviewsQuery.docs
        .map((r) => Review.FromJson(r.data() as Map<String, dynamic>, r.id))
        .toList();
    return reviews;
  }

  Future<Review?> getReviewById(String reviewId) async {
    var review = await _db.doc(reviewId).get();
    if (review.exists) {
      return Review.FromJson(review.data()! as Map<String, dynamic>, reviewId);
    }

    return null;
  }

  Future<String> reviewFilm(int filmId, String review, double rating,
      DateTime reviewDate, String profileId, String reviewId) async {
    var userReview = <String, dynamic>{
      "ReviewDate": reviewDate,
      "Rating": rating,
      "Review": review,
      "ProfileId": profileId,
      "FilmId": filmId
    };

    return _db
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
        .doc(reviewId)
        .delete()
        .then((value) => "", onError: (error) => error.toString());
  }
}
