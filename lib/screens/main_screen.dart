import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 200,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildCard(),
              SizedBox(width: 12),
              buildCard(),
              SizedBox(width: 12),
              buildCard(),
              SizedBox(width: 12),
              buildCard(),
              SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() => Container(
        width: 150,
        height: 200,
        color: Colors.red,
      );
}
