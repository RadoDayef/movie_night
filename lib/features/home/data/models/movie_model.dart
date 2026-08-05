class MovieModel {
  bool adult;
  int id, voteCount;
  List<int> genreIds;
  double popularity, voteAverage;
  String title, overview, posterPath, releaseDate, backdropPath, originalTitle, originalLanguage;

  MovieModel({
    required this.id,
    required this.title,
    required this.adult,
    required this.overview,
    required this.genreIds,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      adult: json["adult"],
      overview: json["overview"],
      voteCount: json["vote_count"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      backdropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      genreIds: List<int>.from(json["genre_ids"]),
      originalLanguage: json["original_language"],
    );
  }
}
