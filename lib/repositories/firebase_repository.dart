import 'package:firebase_auth/firebase_auth.dart';

//função para entrar no app
Future signIn(email, password) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(), password: password.text.trim());
}

//função para se registrar no app
Future signUp(password, confirmpassword, email) async {
  if (verifyPassword(password, confirmpassword)) {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
    //_gotoProfile(); //quebra galho, corrigir redirecionamento após registro
  }
}

//função de validação que verifica se as senhas são iguais
bool verifyPassword(password, confirmpassword) {
  if (password.text.trim() == confirmpassword.text.trim()) {
    return true;
  } else {
    return false;
  }
}
