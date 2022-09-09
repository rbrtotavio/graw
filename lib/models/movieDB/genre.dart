class Genre {
  final int genreId;
  final String genreName;

  Genre({
    required this.genreId,
    required this.genreName,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      genreId: json["id"],
      genreName: json["name"],
    );
  }
}
