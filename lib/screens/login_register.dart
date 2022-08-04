import 'package:flutter/material.dart';
import 'package:cinegraw_app/screens/main_screen.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'GRAW',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
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
                onPressed: () {},
                child: const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'GRAW',
                )));
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
                  _gotoReturn(context);
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
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail válido'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Confirma sua senha'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "REGISTRAR-SE",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
