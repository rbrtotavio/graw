import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrProfile extends StatelessWidget {
  QrProfile({Key? key}) : super(key: key);
  final ProfileApp _profileApp = ProfileApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: _profileApp.getProfile(),
      builder: (context, ssProfile) {
        if (ssProfile.hasData && ssProfile.data != null) {
          return Center(
              child: QrImage(
            data: ssProfile.data!.idProfile,
            size: 300,
          ));
        }
        if (ssProfile.hasError) {
          return Center(
            child: Text(ssProfile.error.toString()),
          );
        }
        return const Center(
          child: Text("Gerando QR Code"),
        );
      },
    );
  }
}
