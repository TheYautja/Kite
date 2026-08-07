import "package:flutter/material.dart";
import "package:kiteapp/ui/components/MovieCard.dart";
import "components/MovieCard.dart";

class Homepage extends StatelessWidget
{
    @override
      Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: AppBar(
                title: Text("homepage"),
            ),
            
            body: ListView(
                children: [
                    MovieCard(),
                    MovieCard(),
                    MovieCard(),
                ]
            ),
        );
      }
}
