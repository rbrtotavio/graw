import 'package:cinegraw_app/applications/auth_app.dart';
import 'package:cinegraw_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:cinegraw_app/screens/main_screen.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthApp _authApp = AuthApp();

  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'GRAW',
                )));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    _gotoReturn(context);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        //decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: const Text("Registrar-se",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 82, 82, 82))))
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                  )),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    _authApp.signIn(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
