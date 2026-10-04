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
                    Flexible(
                        child: SizedBox( 
                            child: GridView(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.5,
                                ),
                                children: movies.map((movie) {
                                    return SizedBox(height: 300, child: MovieCard(movie: movie),);
                                }).toList(),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

}
