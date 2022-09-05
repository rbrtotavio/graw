class ConfigurationMovieDB {
  final String urlImage;
  final String secureUrlImage;
  final List<String> cardSize;
  final List<String> coverSize;

  ConfigurationMovieDB(
    this.urlImage,
    this.secureUrlImage,
    this.cardSize,
    this.coverSize,
  );

  factory ConfigurationMovieDB.fromJson(Map<String, dynamic> json) {
    return ConfigurationMovieDB(
      json["base_url"],
      json["secure_base_url"],
      json["backdrop_sizes"].cast<String>(),
      json["poster_sizes"].cast<String>(),
    );
  }
}
