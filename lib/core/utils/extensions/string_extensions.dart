extension StringExtensions on String {
  String get posterPath => "https://image.tmdb.org/t/p/w500$this";

  String get backdropPath => "https://image.tmdb.org/t/p/w780$this";
}
