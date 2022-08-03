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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list_rounded),
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Lançamentos',
              style: TextStyle(),
              textScaleFactor: 3.0,
            ),
          ),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [buildCarrosel()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard() => Container(
        width: 150,
        height: 200,
        color: Colors.red,
      );
  Widget buildCarrosel() => Row(
        children: [
          buildCard(),
          const SizedBox(width: 12),
          buildCard(),
          const SizedBox(width: 12),
          buildCard(),
          const SizedBox(width: 12),
          buildCard(),
          const SizedBox(width: 12),
          buildCard(),
          const SizedBox(width: 12),
        ],
      );
}
