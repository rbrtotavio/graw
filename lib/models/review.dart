class Review {
  final String reviewId;
  final int filmId;
  final String profileId;
  String review;
  double rating;
  DateTime reviewDate;
  String filmName;
  String profileName;

  Review(
      {required this.reviewId,
      required this.filmId,
      required this.profileId,
      required this.review,
      required this.rating,
      required this.reviewDate,
      required this.filmName,
      required this.profileName});

  factory Review.FromJson(Map<String, dynamic> json, String reviewId) {
    return Review(
        reviewId: reviewId,
        filmId: json["FilmId"],
        review: json["Review"],
        profileId: json["ProfileId"],
        rating: json["Rating"],
        reviewDate: json["ReviewDate"].toDate(),
        filmName: json["FilmName"],
        profileName: json["ProfileName"]);
  }
}
