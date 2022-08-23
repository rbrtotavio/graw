import 'package:flutter/material.dart';
import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);
  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'GRAW',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
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
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //decoration: TextDecoration.underline
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("Registrar-se",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82))))
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                )),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  void _gotoReturn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'GRAW',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
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
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginRegister()));
                      },
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82)))),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
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
            SizedBox(
              height: 70,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail válido'),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Confirma sua senha'),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "REGISTRAR-SE",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
/*class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

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
                    signIn();
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ))
            ],
          ),
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
*/