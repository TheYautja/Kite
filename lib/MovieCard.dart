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

        Size size = MediaQuery.of(context).size;

        return Container
        (
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Stack
            (
                children: 
                [
                    FittedBox
                    (
                        fit: BoxFit.fill,
                        child: Image.network("https://image.tmdb.org/t/p/w500${movie.imgUrl}"),
                    ),

                ],
            ),
        );
    }
}

//"https://image.tmdb.org/t/p/w500${movie.imgUrl}"
