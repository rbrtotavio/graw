import 'package:cinegraw_app/screens/qr-reader.dart';
import 'package:cinegraw_app/screens/qr_profile.dart';
import 'package:flutter/material.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  int _selectedTab = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _pages = <Widget>[QrProfile(), QrReader()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR CODE'),
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "qr-code"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "camera"),
        ],
      ),
    );
  }
}
