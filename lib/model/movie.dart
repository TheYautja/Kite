class Movie {
  int id;
  String name;
  String imgUrl;
  List<int> genre;
  String date;
  double rating;
  String description;

  Movie({
    required this.id,
    required this.name,
    required this.date,
    required this.genre,
    required this.rating,
    required this.imgUrl,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {

    return Movie(
      id: json['id'] ?? 0,
      name: json['title'] ?? "Unknown",
      imgUrl: json['poster_path'] != null ? "https://tmdb.org/t/p/w500${json['poster_path']}" : " ",
      genre: List<int>.from(json['genre_ids'] ?? []),
      date: json['release_date'] ?? "Unknown",
      rating: json['vote_average'].toDouble(),
      description: json['overview'] ?? "No overview avaliable",
    );
  }
}

class MovieResponse {
  final List<Movie> response;

  MovieResponse({required this.response});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      response: List<Movie>.from(
        (json['results'] ?? []).map((x) => Movie.fromJson(x)),
      ),
    );
  }
}
