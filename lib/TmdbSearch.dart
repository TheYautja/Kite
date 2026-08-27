import "package:flutter/material.dart";
import "package:kiteapp/API.dart";
import "package:kiteapp/Movie.dart";
import "package:kiteapp/MovieCard.dart";

class TmdbSearchPage extends StatefulWidget {
  const TmdbSearchPage({super.key});

  @override
  State<TmdbSearchPage> createState() => _TmdbSearchPageState();
}

class _TmdbSearchPageState extends State<TmdbSearchPage> {

    final api = API();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "search by ID/name",
                    ),
                ),
            ),
            body: FutureBuilder(
                future: api.getMovies("top_rated"),
                builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                    }
                    if(snapshot.connectionState == ConnectionState.none){
                        return Text("connection failed");
                    }
                    if(!snapshot.hasData){
                        return Text("empty snapshot");
                    }

                    List<Movie> movieList = snapshot.data!;
                    
                    return ListView.builder(
                        itemCount: movieList.length,
                        itemBuilder: (context, index){
                            return MovieCard(movie: movieList[index]);
                        }
                    );

                },
            ) 
        );
    }
}
