class Movie {
  final String title;
  final String? backDropPath;
  final String? posterPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.title,
    this.backDropPath,
    this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      backDropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      overview: json['overview'] ?? 'No overview available',
      releaseDate: json['release_date'] ?? 'Unknown',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    );
  }
}