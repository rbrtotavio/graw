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

  Future<List<Review>> getFilmReviews(int filmId) async {
    var reviews = await _db
        .collection("ReviewsByFilm")
        .doc(filmId.toString())
        .collection("Reviews")
        .get()
        .then((value) {
      List<Review> listReviews = <Review>[];
      for (var review in value.docs) {
        var r = review.data();
        listReviews.add(Review.FromJson(r, review.id, filmId));
      }
      return listReviews;
    });
    return reviews;
  }
}
