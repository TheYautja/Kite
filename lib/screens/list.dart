import "package:flutter/material.dart";
import "package:kiteapp/widgets/carousel_list.dart";
import "package:kiteapp/widgets/movie_card.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class MovieList extends StatefulWidget {

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
    
    //late List<Movie> movies;
    static DbHelper helper = DbHelper();
    late Future<List<Movie>> moviesFuture;

    @override 
    void initState() {
        super.initState();
        moviesFuture = getMovies();
    }

    Future<List<Movie>> getMovies() async {
        await Future.delayed(Duration(milliseconds: 500));

        return helper.getAllMovies() as Future<List<Movie>>;
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(),
            body: FutureBuilder<List<Movie>>(
                future: moviesFuture,
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

                    final movies = snapshot.data ?? [];

                    return CarouselList(top: movies, popular: [], upcoming: [],);
                    }
            )
        
        );
    }
}
