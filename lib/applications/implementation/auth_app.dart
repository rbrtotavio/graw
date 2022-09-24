import 'package:cinegraw_app/applications/interface/base_app.dart';
import 'package:cinegraw_app/models/result.dart';

class AuthApp extends BaseApp {
  AuthApp();

  Future signIn(String email, String password) async {
    firebaseAuthRepository.signIn(email, password).then((value) => print("OK"),
        onError: (error) => print(error.toString()));
  }

  Future<Result> signUp(String password, String confirmpassword, String email,
      String name) async {
    var user =
        await firebaseAuthRepository.signUp(password, confirmpassword, email);
    if (user == null || user.user == null) {
      return Result.Error("Não foi possivel cadastrar seu usuario");
    }

    await user.user!.updateDisplayName(name);

    var profileCreation =
        await firestoreProfileRepository.createProfile(user.user!);
    if (profileCreation.isNotEmpty) {
      return Result.Error(profileCreation);
    }
    return Result.Success({});
  }

  String getDisplayName() {
    return firebaseAuthRepository.getDisplayName();
  }

  void signOut() {
    firebaseAuthRepository.signOut();
  }
}
