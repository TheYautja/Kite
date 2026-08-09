import "package:flutter/material.dart";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";

class Homepage extends StatelessWidget
{

   Movie testInstance = Movie("testmovie", 123321); 

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
                                MovieCard(testInstance),
                                SizedBox(width: 100, height: 20,),
                                MovieCard(testInstance),
                            ]
                        ),),
                    BottomNav(),
                ]
            )
        );
      }
}
