import "package:flutter/material.dart";
import "Movie.dart";

class MovieCard extends StatelessWidget
{

    Movie movie;

    MovieCard(required this.movie);

    @override
      Widget build(BuildContext context) {
        return Container(
            color: Color(0xFFa4dbd7),
            child: Row(
                children: [
                    ClipRRect( 
                        child: Image.network(movie.imgUrl)
                    ),
                    Text(movie.name),
                    Text(movie.id),
                ]
            ),
        );
      }
}
