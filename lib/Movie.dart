
class Movie {
    
    String id;
    String name;
    String imgUrl;
    Genre genre;
    String date;
    int rating;
    String description;

    
    Movie
    ({
        required this.id,
        required this.name,
        required this.date,
        required this.genre,
        required this.rating,
        required this.imgUrl,
        required this.description
    });


    factory Movie.fromJson(Map<String, dynamic> json)
    {
        return Movie
        (
            id: json['imdb_id'],
            name: json['title'],
            imgUrl: json['poster_path'],
            genre: Genre.fromJson(json['genre']),
            date: json['release_date'],
            rating: json['vote_average'],
            description: json['overview'],
        );
    }

}


class MovieResponse
{
    final List<Movie> response;

    MovieResponse
    ({
        required this.response,
    }); 

   
    factory MovieResponse.fromJson(Map<String, dynamic> json)
    {
        return MovieResponse
        (
            response: List<Movie>.from
            (
                json['results'].map
                (
                    (x) => Movie.fromJson(x),
                )
            )
        );
    }

}


class Genre
{
    final int id;
    final String name;


    Genre
    ({
        required this.id,
        required this.name,
    });


    factory Genre.fromJson(Map<String, dynamic> json)
    {
        return Genre
        (
            id: json['id'],
            name: json['name'],
        );
    }

}
