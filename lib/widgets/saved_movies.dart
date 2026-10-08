import "package:flutter/material.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/widgets/movie_card.dart";

class SavedMovies extends StatelessWidget {
    const SavedMovies({super.key, required this.movies});

    final List<Movie> movies;

    @override
    Widget build(BuildContext context) {
    
        return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.60,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
            },
        );
    }
}

