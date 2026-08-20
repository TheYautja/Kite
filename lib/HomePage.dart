import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";


class Homepage extends StatelessWidget
{

    Future<List<Movie>> PageData() async
    {
        final response = await http.get(Uri.parse("later.com"));

        return MovieResponse.fromJson(json.decode(response.body)).response;
    }

    @override
      Widget build(BuildContext context) 
      {
        return Scaffold
        (      
            appBar: AppBar(title: Text("homepage"),),
            body: FutureBuilder
                (
                    future: PageData(),
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
                        
                        List<Movie> movieList = snapshot.data!;

                        return ListView.builder
                        (
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
                )
    
        );
      }
}
