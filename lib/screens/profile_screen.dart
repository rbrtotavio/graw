import 'package:cinegraw_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _gotoMainScreen(context);
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Color.fromARGB(255, 138, 171, 188),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              Container(
                  height: 100,
                  //color: Color.fromARGB(255, 138, 171, 188),
                  padding: const EdgeInsets.all(20),
                  //alignment: Alignment.topLeft,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Nome do usuário',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text("Bio do usuário")
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Container(
                          child: Column(
                            children: [
                              const Text(
                                'Seguindo',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text('50')
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Seguidores',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('50')
                          ],
                        )
                      ],
                    ),
                  )),
              Container(
                color: Colors.blueGrey,
                padding: EdgeInsets.all(30),
                height: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Review do filme',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Review do filme',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Review do filme',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Review do filme',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              MaterialButton(
                  child: Text("Sair"),
                  color: Colors.grey,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  })
            ],
          ),
        ));
  }
}
