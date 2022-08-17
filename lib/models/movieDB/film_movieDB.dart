class FilmMovieDB {
  final int filmId;
  final String titulo;
  final String tituloOriginal;
  final String sinopse;
  final DateTime dataLancamento;
  final bool conteudoAdulto;
  final String imagemFundoPath;
  final String imagemPosterPath;
  final List<int> generosIds;
  final double popularidade;
  final double nota;
  final int qtdVotos;
  final String linguagemOriginal;
  final bool video;

  FilmMovieDB({
    required this.filmId,
    required this.titulo,
    required this.tituloOriginal,
    required this.sinopse,
    required this.dataLancamento,
    required this.conteudoAdulto,
    required this.imagemFundoPath,
    required this.imagemPosterPath,
    required this.generosIds,
    required this.popularidade,
    required this.nota,
    required this.qtdVotos,
    required this.linguagemOriginal,
    required this.video,
  });

  factory FilmMovieDB.fromJson(Map<String, dynamic> json) {
    return FilmMovieDB(
        filmId: json["id"],
        titulo: json["title"],
        tituloOriginal: json["original_title"],
        sinopse: json["overview"],
        dataLancamento: DateTime.parse(json["release_date"]),
        conteudoAdulto: json["adult"],
        imagemFundoPath: json["backdrop_path"],
        imagemPosterPath: json["poster_path"],
        generosIds: json["genre_ids"].cast<int>(),
        popularidade: json["popularity"],
        nota: json["vote_average"],
        qtdVotos: json["vote_count"],
        linguagemOriginal: json["original_language"],
        video: json["video"]);
  }
}
