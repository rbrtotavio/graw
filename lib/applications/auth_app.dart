import 'package:cinegraw_app/repositories/firebase_auth_repository.dart';

class AuthApp {
  final FirebaseAuthRepository _firebaseAuthentication =
      FirebaseAuthRepository();

  AuthApp();

  Future signIn(String email, String password) async {
    await _firebaseAuthentication.signIn(email, password);
  }

  Future signUp(String password, String confirmpassword, String email) async {
    await _firebaseAuthentication.signUp(password, confirmpassword, email);
  }

  void signOut() {
    _firebaseAuthentication.signOut();
  }

  bool verifyUser() {
    return _firebaseAuthentication.getUser() != null;
  }
}