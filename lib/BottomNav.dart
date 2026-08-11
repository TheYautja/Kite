import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "HomePage.dart";
import "List.dart";
import "Search.dart";
import "MoviePlayer.dart";

class BottomNav extends StatelessWidget
{

    @override
      Widget build(BuildContext context){
        return Container(
            color: Colors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    IconButton(icon: Icon(Icons.home), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                    },),
                    IconButton(icon: Icon(Icons.list), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieList()));
                    },),
                    IconButton(icon: Icon(Icons.person), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePlayer()));
                    },),
                ] 
            ),
        );
      }
}
