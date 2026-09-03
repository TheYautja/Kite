import "package:flutter/material.dart";
import "package:kiteapp/widgets/movie_card.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class MovieList extends StatelessWidget {

    List<dynamic> movies = [];
    static DbHelper dbHelper = DbHelper();


    final Movie movie = Movie(id: 1, name: "test", date: "1/1/1", genre: [1, 2], rating: 1.1, imgUrl: "aaa", description: "description");


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(),
            body: FutureBuilder(
                future: dbHelper.getAllMovies(),
                builder: (context, snapshot){

                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (!snapshot.hasData) {
                        return Text("Empty snapshot");
                    }                

                    return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, int index){
                            return Column(
                            children: [
                                MovieCard(movie: movies[index]), 
                                IconButton(onPressed:(){dbHelper.insertMovie(movie);}, icon: Icon(Icons.mic))
                            ]
                            );
                        },
                    );
                }
            )
        
        );
    }

}
