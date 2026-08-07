import "package:flutter/material.dart";
import "package:kiteapp/ui/components/MovieCard.dart";
import "components/MovieCard.dart";
import "components/BottomNav.dart";

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
