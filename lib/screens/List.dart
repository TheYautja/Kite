import "package:flutter/material.dart";
import "package:kiteapp/widgets/MovieCard.dart";
import "package:kiteapp/model/Movie.dart";

class MovieList extends StatelessWidget {
  //Movie movie = Movie(name: "big if true", id: "123345", imgUrl: "https://picsum.photos/200");

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
