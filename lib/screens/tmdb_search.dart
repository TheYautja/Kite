import "package:flutter/material.dart";
import "package:kiteapp/api/movie_requests.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/widgets/movie_card.dart";

class TmdbSearchPage extends StatefulWidget {
  const TmdbSearchPage({super.key});

  @override
  State<TmdbSearchPage> createState() => _TmdbSearchPageState();
}

class _TmdbSearchPageState extends State<TmdbSearchPage> {

    final api = MovieRequests();
    final TextEditingController _searchController = TextEditingController();
    late Future<List<Movie>> results;


    @override
      void initState() {
        super.initState();
        results = api.getMovies("upcoming");
      }


    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: TextField(
                    controller: _searchController,
                    onSubmitted: (String text){
                        setState(() {
                            results = api.searchByName(text);
                        });                       
                    }, 
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "search by ID/name",
                    ),
                     
                ),
            ),
            body: FutureBuilder(
                future: results,
                builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                    }
                    if(snapshot.connectionState == ConnectionState.none){
                        return Text("connection failed");
                    }
                    if(!snapshot.hasData){
                        return Center(child: Text("No results found"));
                    }

                    List<Movie> movieList = snapshot.data!;
                    
                    return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                        ),
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
