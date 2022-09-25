import 'package:cinegraw_app/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProfileRepository {
  bool _configured = false;
  late CollectionReference _db;

  static final FirestoreProfileRepository _firestoreProfileRepository =
      FirestoreProfileRepository._internal();

  factory FirestoreProfileRepository() {
    _firestoreProfileRepository.configure();
    return _firestoreProfileRepository;
  }

  FirestoreProfileRepository._internal();

  void configure() {
    if (!_configured) {
      _configured = true;
      _db = FirebaseFirestore.instance.collection("Profiles");
    }
  }

  Future<Profile?> getByUser(User user) async {
    var profile = await _db.doc(user.uid).get();
    if (profile.exists) {
      return Profile.FromFirebase(
          profile.data()! as Map<String, dynamic>, user);
    }

    return null;
  }

  Future<String> createProfile(User user) async {
    var profile = <String, dynamic>{
      "Bio": "future incrementation",
      "BirthDate": DateTime.now(),
      "UrlCover": "future incrementation"
    };
    return await _db.doc(user.uid).set(profile).then((value) => "",
        onError: (error) =>
            "Não foi possivel finalizar a criação do seu perfil");
  }
}
