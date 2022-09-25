import 'package:cinegraw_app/applications/interface/base_app.dart';
import 'package:cinegraw_app/models/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthApp extends BaseApp {
  AuthApp();

  Future<Result> signIn(String email, String password) async {
    var r = await firebaseAuthRepository.signIn(email, password).then(
        (value) => Result.Success({}),
        onError: (error) => Result.Error("Não foi possivel realizar o login"));
    return r;
  }

  Future<Result> signUp(String password, String confirmpassword, String email,
      String name) async {
    if (password.trim() != confirmpassword.trim()) {
      return Result.Error("Insira a mesma senha nos campos de senha");
    }

    try {
      var user =
          await firebaseAuthRepository.signUp(password, confirmpassword, email);
      if (user == null || user.user == null) {
        return Result.Error("Não foi possivel cadastrar seu usuario");
      }

      var profileCreation =
          await firestoreProfileRepository.createProfile(user.user!, name);
      if (profileCreation.isNotEmpty) {
        user.user!.delete();
        return Result.Error(profileCreation);
      }

      return Result.Success({});
    } on FirebaseException catch (error) {
      if (error.code == "invalid-email") {
        return Result.Error("Email inválido");
      } else if (error.code == "weak-password") {
        return Result.Error("Utilize uma senha com 6 caracteres ou mais");
      }
      return Result.Error(error.message!);
    }
  }

  String getDisplayName() {
    return firebaseAuthRepository.getDisplayName();
  }

  void signOut() {
    firebaseAuthRepository.signOut();
  }
}
