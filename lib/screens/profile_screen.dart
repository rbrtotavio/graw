import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/components/review_list.dart';
import 'package:cinegraw_app/models/review.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileApp _profileApp = ProfileApp();

  void _gotoMainScreen(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _gotoMainScreen(context);
            },
          ),
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
                child: const Icon(
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
                      Flexible(
                        child: Column(
                          children: [
                            const Text(
                              'Nome do usuário',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(children: [
                          Column(
                            children: [
                              const Text(
                                'Seguindo',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text('50')
                            ],
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
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<Review>>(
                future: _profileApp.getUserReviews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ReviewList(reviews: snapshot.data!);
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ));
  }
}
