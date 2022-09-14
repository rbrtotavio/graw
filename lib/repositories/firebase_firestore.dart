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
}
