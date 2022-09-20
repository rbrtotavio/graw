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
  final FirestoreProfileRepository _firestoreProfileRepository =
      FirestoreProfileRepository();
  final MovieDBApiRepository movieDBApiRepository = MovieDBApiRepository();

  BaseApp() {
    _user = firebaseAuthRepository.getUser();
  }

  User? getUser() {
    _user ??= firebaseAuthRepository.getUser();
    return _user;
  }
}
