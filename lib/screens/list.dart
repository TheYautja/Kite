import "package:flutter/material.dart";
import "package:kiteapp/widgets/movie_card.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class MovieList extends StatefulWidget {

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
    
    late List<Movie> movies;
    static DbHelper helper = DbHelper();

    @override 
    void initState() {
        super.initState();
        movies = [Movie(id: 999, name: "teste", date: "1/1/1", rating: 6.7, imgUrl: "aaabbbccc", description: "test movie"),];
      }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(),
            body: FutureBuilder(
                future: helper.getAllMovies(),
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
                                    SizedBox(width: 100,height: 100,child: MovieCard(movie: movies[index])), 
                                ]
                            );
                        },
                    );
                }
            )
        
        );
    }
}
