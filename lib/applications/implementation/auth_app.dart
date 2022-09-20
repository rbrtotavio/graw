import 'package:cinegraw_app/applications/interface/base_app.dart';

class AuthApp extends BaseApp {
  AuthApp();

  Future signIn(String email, String password) async {
    firebaseAuthRepository.signIn(email, password).then((value) => print("OK"),
        onError: (error) => print(error.toString()));
  }

  Future signUp(String password, String confirmpassword, String email) async {
    await firebaseAuthRepository.signUp(password, confirmpassword, email);
  }

  void signOut() {
    firebaseAuthRepository.signOut();
  }
}
