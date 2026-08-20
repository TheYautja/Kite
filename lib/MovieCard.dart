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
            child: Row
            (
                children: 
                [
                    ClipRRect(child: Image.network(movie.imgUrl)),
                    Column
                    (
                        children: 
                        [
                            Text(movie.name),
                            //Text(movie.date),
                            //Text(movie.genre),
                            //Text(movie.rating),
                            //Text(movie.description),
                        ],
                    ),
                    Column
                    (
                        children:
                        [
                            IconButton
                            (
                                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePlayer(movie: movie)));}, 
                                icon: Icon(Icons.play_arrow),
                            ),
                            IconButton
                            (
                                onPressed: (){},
                                icon: Icon(Icons.add_circle),
                            ),
                        ],
                    ),
                ]
            )
        ); 
      }
}
