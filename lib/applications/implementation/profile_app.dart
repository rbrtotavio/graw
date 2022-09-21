import 'package:cinegraw_app/applications/interface/base_app.dart';
import 'package:cinegraw_app/models/result.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:uuid/uuid.dart';

class ProfileApp extends BaseApp {
  ProfileApp();

  Future<List<Review>> getUserReviews() async {
    var profile = await getProfile();
    if (profile == null) {
      return <Review>[];
    }
    return await firestoreReviewRepository.getReviewsByUser(profile.idProfile);
  }

  Future<Result> reviewFilm(
      int filmId, String review, double rating, String? reviewId) async {
    var user = firebaseAuthRepository.getUser();
    if (user == null) {
      return Result.Error("É necessario estar logado para realizar essa ação");
    }

    DateTime dataReview = DateTime.now();
    reviewId ??= const Uuid().v4();
    var resultado = await firestoreReviewRepository.reviewFilm(
        filmId, review, rating, dataReview, user.uid, reviewId);

    if (resultado.isNotEmpty) {
      return Result.Error(resultado);
    }
    return Result.Success("");
  }

  Future<Result> deleteReview(String reviewId) async {
    var profile = await getProfile();
    if (profile == null) {
      return Result.Error("É necessario estar logado para realizar essa ação");
    }

    var resultado = await firestoreReviewRepository.deleteReview(reviewId);

    if (resultado.isNotEmpty) {
      return Result.Error(resultado);
    }
    return Result.Success("");
  }
}
