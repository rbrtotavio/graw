import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/repositories/firebase_auth_repository.dart';
import 'package:cinegraw_app/repositories/firestore_profile_repository.dart';
import 'package:cinegraw_app/repositories/firestore_review_repository.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseApp {
  User? _user;
  final FirebaseAuthRepository firebaseAuthRepository =
      FirebaseAuthRepository();
  final FirestoreReviewRepository firestoreReviewRepository =
      FirestoreReviewRepository();
  final FirestoreProfileRepository firestoreProfileRepository =
      FirestoreProfileRepository();
  final MovieDBApiRepository movieDBApiRepository = MovieDBApiRepository();

  BaseApp() {
    _user = firebaseAuthRepository.getUser();
  }

  Future<Profile?> getProfile() async {
    _user ??= firebaseAuthRepository.getUser();
    if (_user == null) {
      return null;
    }
    return await firestoreProfileRepository.getByUser(_user!);
  }
}
