class Movie {
    int id;
    String name;
    String imgUrl;
    //List<int> genre;
    String date;
    double rating;
    String description;

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
            rating: json['vote_average'].toDouble(),
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

    factory Movie.fromDbResponse(Map<String, dynamic> res){
        
        return Movie(
            id: res['id'],
            name: res['name'],
            imgUrl: res['imgUrl'],
            rating: res['rating'],
            description: res['description'],
            date: res['date'],
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
