import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "dart:convert";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";


class Homepage extends StatelessWidget
{

    Future<List<Movie>> PageData() async
    {

        await dotenv.load();
        final url = Uri.parse("https://api.themoviedb.org/3/movie/popular");
        final key = dotenv.get('ACCESS_TOKEN');

        final response = await http.get
        (
            url, 
            headers: {'Authorization': 'Bearer $key', 'Accept': 'application/json',}
        );
        
        if(response.statusCode == 200)
        {
            return MovieResponse.fromJson(json.decode(response.body)).response;
        }
        else 
        {
            throw Exception("Error: ${response.statusCode}");
        }
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
                        
                        if(!snapshot.hasData){return Text("Empty snapshot");}

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
