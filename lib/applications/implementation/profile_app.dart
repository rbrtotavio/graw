import 'package:cinegraw_app/applications/interface/base_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/models/result.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:uuid/uuid.dart';

class ProfileApp extends BaseApp {
  ProfileApp();

  Future<Profile?> getbyId(String profileId) async {
    return await firestoreProfileRepository.getByProfileId(profileId);
  }

  Future<List<Review>> getUserReviews() async {
    var profile = await getProfile();
    if (profile == null) {
      return <Review>[];
    }
    return await firestoreReviewRepository.getReviewsByUser(profile.idProfile);
  }

  Future<List<Review>> getUserReviewsByProfileId(String profileId) async {
    return await firestoreReviewRepository.getReviewsByUser(profileId);
  }

  Future<Result> reviewFilm(int filmId, String filmName, String review,
      String rating, String? reviewId) async {
    var profile = await getProfile();
    if (profile == null) {
      return Result.Error("É necessario estar logado para realizar essa ação");
    }

    if (rating.isEmpty) {
      return Result.Error("Insira uma nota");
    }

    if (review.isEmpty) {
      return Result.Error("Insira uma review");
    }

    DateTime dataReview = DateTime.now();
    reviewId ??= const Uuid().v4();
    var resultado = await firestoreReviewRepository.reviewFilm(
        filmId,
        filmName,
        review,
        int.parse(rating),
        dataReview,
        profile.idProfile,
        profile.name,
        reviewId);

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
      return Result.Error("Não foi possivel excluir sua review");
    }
    return Result.Success("");
  }

  Future<bool> isLogged() async {
    return await getProfile() != null;
  }
}
