import "package:flutter/material.dart";
import "package:kiteapp/widgets/MovieCard.dart";
import "package:kiteapp/model/Movie.dart";

class MovieList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          //MovieCard(movie: movie),
        ],
      ),
    );
  }
}
