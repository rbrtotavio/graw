import 'package:cinegraw_app/applications/implementation/profile_app.dart';
import 'package:cinegraw_app/models/profile.dart';
import 'package:cinegraw_app/screens/components/review_list.dart';
import 'package:cinegraw_app/config/utilities.dart';
import 'package:flutter/material.dart';
import 'package:cinegraw_app/utility/appthemes.dart' as theme;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileApp _profileApp = ProfileApp();

  void _gotoMainScreen(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GRAW'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _gotoMainScreen(context);
            },
          ),
        ),
        body: SingleChildScrollView(
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
              FutureBuilder<Profile?>(
                future: _profileApp.getProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('${snapshot.error}');
                  }
                  return Flex(
                    direction: Axis.vertical,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: theme.colorAppbar,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.hasData
                                        ? snapshot.data!.name
                                        : "Trazendo nome",
                                    style: Utilities.styleTitle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Seguindo: ",
                                        style: TextStyle(color: theme.colorBG),
                                      ),
                                      Text(
                                        "201",
                                        style: TextStyle(
                                            color: theme.colorBG,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      VerticalDivider(
                                        thickness: 2.0,
                                        width: 8.0,
                                        color: theme.colorBG,
                                      ),
                                      Text(
                                        "Seguidores: ",
                                        style: TextStyle(color: theme.colorBG),
                                      ),
                                      Text(
                                        "101",
                                        style: TextStyle(
                                            color: theme.colorBG,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              ReviewList(isProfileScreen: true)
            ],
          ),
        ));
  }
}
