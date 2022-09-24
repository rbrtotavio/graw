import 'package:cinegraw_app/applications/interface/base_app.dart';

class AuthApp extends BaseApp {
  AuthApp();

  Future signIn(String email, String password) async {
    firebaseAuthRepository.signIn(email, password).then((value) => print("OK"),
        onError: (error) => print(error.toString()));
  }

  Future signUp(String password, String confirmpassword, String email,
      String name) async {
    var user =
        await firebaseAuthRepository.signUp(password, confirmpassword, email);
    if (user == null || user.user == null) {
      print("Não foi possivel cadastrar seu usuario");
      return;
    }
    await user.user!.updateDisplayName(name);
  }

  String getDisplayName() {
    return firebaseAuthRepository.getDisplayName();
  }

  void signOut() {
    firebaseAuthRepository.signOut();
  }
}
