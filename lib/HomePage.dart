import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "dart:convert";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";
import "API.dart";

class Homepage extends StatelessWidget
{

    API api = new API();

    @override
      Widget build(BuildContext context) 
      {
        return Scaffold
        (      
            appBar: AppBar(title: Text("homepage"),),
            body: FutureBuilder
                (
                    future: api.getMovies("top_rated"),
                    builder: (context, snapshot)
                    {   
                        if(snapshot.connectionState == ConnectionState.waiting)
                        {
                            return Center
                            (
                                child: CircularProgressIndicator(),
                            );
                        }
                        if(snapshot.hasError)
                        {
                            return Center
                            (
                                child: Text("Error: ${snapshot.error}"),
                            );
                        }
                        
                        if(!snapshot.hasData){return Text("Empty snapshot");}

                        List<Movie> movieList = snapshot.data!;

                        return GridView.builder
                        (
                            padding: const EdgeInsets.all(8),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                            (
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.65
                            ),
                            itemCount: movieList.length,
                            itemBuilder: (context, index)
                            {
                                return MovieCard
                                (
                                    movie: movieList[index],
                                );
                            }
                        );

                    }
                ),
                bottomSheet: BottomNav(),
    
        );
      }
}
