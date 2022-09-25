import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/screens/login_register.dart';
import 'package:cinegraw_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class LoginAuth extends StatelessWidget {
  LoginAuth({Key? key}) : super(key: key);
  ProfileApp _profileApp = ProfileApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _profileApp.isLogged(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            Profile? profile =
                ModalRoute.of(context)!.settings.arguments as Profile?;
            return ProfilePage(
              profile: profile,
            );
          } else {
            return const LoginRegister();
          }
        },
      ),
    );
  }
}
