class Movie {
    final int id;
    final String name;
    final String imgUrl;
    //List<int> genre;
    final String date;
    final double rating;
    final String description;

    Movie({
        required this.id,
        required this.name,
        required this.date,
        //required this.genre,
        required this.rating,
        required this.imgUrl,
        required this.description,
    });

    
    factory Movie.fromJson(Map<String, dynamic> json){

        return Movie(
            id: json['id'] ?? 0,
            name: json['title'] ?? "Unknown",
            imgUrl: json['poster_path'] != null ? "https://tmdb.org/t/p/w500${json['poster_path']}" : " ",
            //genre: List<int>.from(json['genre_ids'] ?? []),
            date: json['release_date'] ?? "Unknown",
            rating: json['vote_average'] != null ? json['vote_average'].toDouble() : 0.0,
            description: json['overview'] ?? "No overview avaliable",
        );

    }

    
    Map<String, dynamic> toJson() {
        
        return <String, dynamic>{
           'id': id,
           'name': name,
           'date': date,
           'rating': rating,
           'imgUrl': imgUrl,
           'description': description,
        };
    
    }

    factory Movie.fromDbResponse(Map<String, dynamic> res) {
        return Movie(
            id: (res["id"] as num?)?.toInt() ?? 0,
            name: res["name"] as String? ?? "Unknown",
            imgUrl: res["imgUrl"] as String? ?? "",
            date: res["date"] as String? ?? "Unknown",
            rating: (res["rating"] as num?)?.toDouble() ?? 0.0,
            description: res["description"] as String? ?? "No overview available",
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
