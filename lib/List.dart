import "package:flutter/material.dart";
import "package:kiteapp/KiteAppbar.dart";
import "MovieCard.dart";
import "Movie.dart";
import "KiteAppbar.dart";

class MovieList extends StatelessWidget
{

    Movie movie = Movie(name: "big if true", id: "123345", imgUrl: "https://picsum.photos/200");

    @override
      Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(),
            body: ListView(
                children: [
                    MovieCard(movie: movie),
                ]
            )
        );
      }
}
