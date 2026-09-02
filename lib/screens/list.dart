import "package:flutter/material.dart";
import "package:kiteapp/widgets/movie_card.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class MovieList extends StatelessWidget {

    late List<Movie> movies;
    DbHelper dbHelper = DbHelper();


    Movie movie = Movie(id: 1, name: "test", date: "1/1/1", genre: [1, 2], rating: 1.1, imgUrl: "aaa", description: "description");


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(),
            body: Column(
                children: [
                    IconButton(onPressed: (){dbHelper.insertMovie(movie);}, icon: Icon(Icons.book)),
                    IconButton(onPressed: (){dbHelper.deleteMovieById([1]);}, icon: Icon(Icons.assessment)),
                ]
            )
        );
    }

}
