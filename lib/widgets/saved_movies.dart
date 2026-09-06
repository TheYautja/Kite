import "package:flutter/material.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/widgets/movie_card.dart";

class SavedMovies extends StatelessWidget {

    late List<Movie> movies;

    SavedMovies({required this.movies});

    @override 
    Widget build(BuildContext context){
        return Expanded(
            child: Column(
                children: [
                    Text("local movies"),
                    ListView(
                        itemExtent: 150,
                        children: movies.map((movie) {
                            return MovieCard(movie: movie);
                        }).toList(),
                    ),
                ],
            ),
        );
    }

}
