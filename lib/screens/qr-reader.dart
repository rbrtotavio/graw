import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/utility/appthemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrReader extends StatelessWidget {
  QrReader({Key? key}) : super(key: key);
  final ProfileApp _profileApp = ProfileApp();

  _gotoProfile(BuildContext context, Profile profile) {
    Navigator.pushNamed(context, '/auth_page', arguments: profile);
  }

  readQRCode(BuildContext context) async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      '#EE4B2B',
      'Cancelar',
      false,
      ScanMode.QR,
    );
    if (code != '-1') {
      Profile? profile = await _profileApp.getbyId(code);
      if (profile != null) {
        _gotoProfile(context, profile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              readQRCode(context);
            },
            icon: const Icon(Icons.qr_code),
            label: const Text('Encontrar usuário'),
            style: ElevatedButton.styleFrom(primary: colorAppbar),
          )
        ],
      ),
    );
  }
}
