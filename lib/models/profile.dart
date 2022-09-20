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

  factory Profile.FromJson(Map<String, dynamic> json, String idProfile) {
    return Profile(
      idProfile: idProfile,
      name: json["Name"],
      bio: json["Bio"],
      urlCover: json["UrlCover"],
      birthDate: json["BirthDate"],
    );
  }
}
