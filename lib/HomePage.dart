import "package:flutter/material.dart";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";

class Homepage extends StatelessWidget
{

   Movie testInstance = Movie(name: "testmovie", id: "123321", imgUrl: "https://picsum.photos/200"); 

    @override
      Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: AppBar(
                title: Text("homepage"),
            ),
            
            body: Column(
                children: [
                    Expanded(
                        child: ListView(
                            children: [
                                MovieCard(movie: testInstance),
                                SizedBox(width: 100, height: 20,),
                                MovieCard(movie : testInstance),
                            ]
                        ),),
                    BottomNav(),
                ]
            )
        );
      }
}
