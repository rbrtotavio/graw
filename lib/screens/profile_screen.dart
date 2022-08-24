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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _gotoReturn(context);
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text("Logado"),
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
