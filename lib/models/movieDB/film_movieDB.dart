class FilmMovieDB {
  final int filmId;
  final String title;
  final String originalTitle;
  final String overview;
  final DateTime? releaseDate;
  final bool isAdultContent;
  final String coverImagePath;
  final String cardImagePath;
  final List<int> genresIds;
  final double popularity;
  final double average;
  final int voteCount;
  final String originalLang;
  final bool hasVideo;

  FilmMovieDB({
    required this.filmId,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.isAdultContent,
    required this.coverImagePath,
    required this.cardImagePath,
    required this.genresIds,
    required this.popularity,
    required this.average,
    required this.voteCount,
    required this.originalLang,
    required this.hasVideo,
  });

  factory FilmMovieDB.fromJson(Map<String, dynamic> json) {
    return FilmMovieDB(
        filmId: json["id"] ?? -1,
        title: json["title"] ?? "",
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"] ?? "",
        releaseDate: json["release_date"].isNotEmpty
            ? DateTime.parse(json["release_date"])
            : null,
        isAdultContent: json["adult"],
        coverImagePath: json["backdrop_path"] ?? "",
        cardImagePath: json["poster_path"] ?? "",
        genresIds:
            json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [],
        popularity: json["popularity"] != null
            ? double.parse(json["popularity"].toString())
            : -1.0,
        average: json["vote_average"] != null
            ? double.parse(json["vote_average"].toString())
            : -1.0,
        voteCount: json["vote_count"] ?? -1,
        originalLang: json["original_language"] ?? "",
        hasVideo: json["video"]);
  }
}
