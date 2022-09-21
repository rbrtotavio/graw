import 'package:cinegraw_app/applications/implementation/auth_app.dart';
import 'package:flutter/material.dart';
import 'login_register.dart';
import 'main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final AuthApp _authApp = AuthApp();

  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'GRAW',
                )));
  }

  void _gotoMainScreen(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _gotoMainScreen(context);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginRegister()));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82)))),
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    "Registrar-se",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail válido'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _confirmpasswordController,
              decoration:
                  const InputDecoration(labelText: 'Confirma sua senha'),
              obscureText: true,
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  _authApp.signUp(
                      _passwordController.text,
                      _confirmpasswordController.text,
                      _emailController.text,
                      _nomeController.text);
                },
                child: const Text(
                  "Registrar-se",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
