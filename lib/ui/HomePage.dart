import "package:flutter/material.dart";
import "MovieCard.dart";
import "BottomNav.dart";

class Homepage extends StatelessWidget
{
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
                                MovieCard(),
                                MovieCard(),
                            ]
                        ),),
                    BottomNav(),
                ]
            )
        );
      }
}
