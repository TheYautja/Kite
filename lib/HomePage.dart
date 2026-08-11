import "package:flutter/material.dart";
import "package:kiteapp/KiteAppbar.dart";
import "MovieCard.dart";
import "BottomNav.dart";
import "Movie.dart";
import "KiteAppbar.dart";

class Homepage extends StatelessWidget
{

   Movie testInstance = Movie(name: "testmovie", id: "123321", imgUrl: "https://picsum.photos/200"); 

    @override
      Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: AppBar(),
            
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
