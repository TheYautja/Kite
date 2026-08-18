import "package:flutter/material.dart";
import "package:kiteapp/MoviePlayer.dart";
import "Movie.dart";
import "MoviePlayer.dart";

class MovieCard extends StatelessWidget
{

    Movie movie;

    MovieCard({required this.movie});

    @override
      Widget build(BuildContext context)
      {
        return Container
        (
            color: Color(0xFFa4dbd7),
            child: GestureDetector
            (
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  MoviePlayer(movie: movie)));},
                child: Row
                (
                    children: 
                    [
                        ClipRRect(child: Image.network(movie.imgUrl)),
                        Text(movie.name),
                        Text(movie.id),
                    ]
                )
            ) 
        );
      }
}
