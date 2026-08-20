import "package:flutter/material.dart";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";


class Homepage extends StatelessWidget
{

   Movie testInstance = Movie(name: "testmovie", id: "123321", imgUrl: "https://picsum.photos/200"); 

    //Future<List<Movie>> PageData(){}

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
                                    movie: movieList[index.movie],
                                );
                            }
                        )

                    }
                )
    
        );
      }
}
