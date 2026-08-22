import "package:flutter/material.dart";
import "package:kiteapp/MoviePlayer.dart";
import "Movie.dart";


class MovieCard extends StatelessWidget
{

    Movie movie;

    MovieCard({required this.movie});

    @override
    Widget build(BuildContext context)
    {
        return Card
        (
            child: Column
            (
                children: 
                [
                    ListTile
                    (
                        leading: CircleAvatar
                        (
                            backgroundImage: NetworkImage
                            (
                                "https://image.tmdb.org/t/p/w500${movie.imgUrl}"
                            ),
                        ),
                        title: Text(movie.name),
                        subtitle: Text(movie.rating.toString()),
                        trailing: Text(movie.date),
                    ),
                ],
            )
        );
    }
}
