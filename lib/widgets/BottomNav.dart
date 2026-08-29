import "package:flutter/material.dart";
import "package:kiteapp/common/Common.dart";
import "package:kiteapp/screens/HomePage.dart";
import "package:kiteapp/screens/List.dart";

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
