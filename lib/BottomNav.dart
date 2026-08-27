import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:kiteapp/Common.dart";
import "HomePage.dart";
import "List.dart";

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kiteLightB,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: kiteDarkB,
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            IconButton(
              color: kiteDarkB,
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieList()),
                );
              },
            ),
            IconButton(
              color: kiteDarkB,
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Text("later")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
