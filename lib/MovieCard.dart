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

        return SizedBox
        (
            width: size.width/3,
            height: size.height/3,
            child: Stack
            (
                children: 
                [
                    Image.network("https://image.tmdb.org/t/p/w500${movie.imgUrl}"),

                ],
            ),
        );
    }
}

//"https://image.tmdb.org/t/p/w500${movie.imgUrl}"
