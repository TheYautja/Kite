import "package:flutter/material.dart";
import "package:kiteapp/widgets/movie_poster.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/screens/movie_player.dart";

class ClickablePoster extends StatelessWidget {
    
    late final Movie movie;

    ClickablePoster({required this.movie});

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => MoviePlayer(movie: movie)));
            },
            child: MoviePoster(path: movie.imgUrl),
        );
    }

}
