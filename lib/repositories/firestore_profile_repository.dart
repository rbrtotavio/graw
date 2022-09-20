import 'package:cinegraw_app/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<Profile?> getById(profileId) async {
    var profile = await _db.doc(profileId).get();
    if (profile.exists) {
      return Profile.FromJson(
          profile.data()! as Map<String, dynamic>, profileId);
    }

    return null;
  }
}
