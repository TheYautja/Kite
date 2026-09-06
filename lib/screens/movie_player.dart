import 'package:flutter/material.dart';
import 'package:kiteapp/widgets/bottom_nav.dart';
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/widgets/player.dart";
import "package:kiteapp/widgets/movie_data.dart";

class MoviePlayer extends StatelessWidget {
  
    late final Movie movie;

    MoviePlayer({required this.movie});


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Watch')),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(flex: 3, child: Player(id: movie.id)),
                    Expanded(flex: 7, child: MovieData(movie: movie)),
                ],
            ),
            bottomSheet: BottomNav(),
        );
    }
}
