import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  bool _configured = false;
  late FirebaseAuth _db;

  // Sigleton
  static final FirebaseAuthRepository _firebaseAuthRepository =
      FirebaseAuthRepository._internal();

  factory FirebaseAuthRepository() {
    _firebaseAuthRepository.configure();
    return _firebaseAuthRepository;
  }

  FirebaseAuthRepository._internal();

  void configure() {
    if (!_configured) {
      _configured = true;
      _db = FirebaseAuth.instance;
    }
  }

  //função para entrar no app
  Future signIn(String email, String password) async {
    await _db.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  //função para se registrar no app
  Future<UserCredential?> signUp(
      String password, String confirmpassword, String email) async {
    if (_verifyPassword(password, confirmpassword)) {
      return await _db.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    }
    return null;
  }

  void signOut() async {
    await _db.signOut();
  }

  //função de validação que verifica se as senhas são iguais
  bool _verifyPassword(String password, String confirmpassword) {
    if (password.trim() == confirmpassword.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //  TODO:corrigir bug: não pode ser usado com acesso estático
  String getDisplayName() {
    String name = _db.currentUser!.displayName.toString();
    return name;
  }

  User? getUser() {
    return _db.currentUser;
  }
}
