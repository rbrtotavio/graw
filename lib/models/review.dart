class Review {
  final String reviewId;
  final int filmId;
  final String usuarioId;
  String review;
  double nota;
  DateTime dataReview;

  Review(
      {required this.reviewId,
      required this.filmId,
      required this.usuarioId,
      required this.review,
      required this.nota,
      required this.dataReview});

  factory Review.FromJson(Map<String, dynamic> json, String reviewId) {
    return Review(
        reviewId: reviewId,
        filmId: json["FilmId"],
        review: json["Review"],
        usuarioId: json["UsuarioId"],
        nota: json["Nota"],
        dataReview: json["DataReview"].toDate());
  }
}
