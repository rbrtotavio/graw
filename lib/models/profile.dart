import 'package:firebase_auth/firebase_auth.dart';

class Profile {
  String idProfile;
  String name;
  String bio;
  String urlCover;
  DateTime birthDate;

  Profile({
    required this.idProfile,
    required this.name,
    required this.bio,
    required this.urlCover,
    required this.birthDate,
  });

  factory Profile.FromFirebase(Map<String, dynamic> json, String profileId) {
    return Profile(
      idProfile: profileId,
      name: json["Name"],
      bio: json["Bio"],
      urlCover: json["UrlCover"],
      birthDate: json["BirthDate"].toDate(),
    );
  }
}
