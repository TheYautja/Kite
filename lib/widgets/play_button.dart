import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";
import "package:kiteapp/model/movie.dart";


class PlayButton extends StatelessWidget {

    late Movie movie;

    PlayButton({required this.movie});

    @override 
    Widget build(BuildContext context){
        return IconButton(
            onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => MoviePlayer(movie: movie)));
            },
            icon: const Icon(Icons.play_circle,),
            color: kitePrimary,
            tooltip: 'Watch',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
        );

    }

}
