import "package:flutter/material.dart";
import "package:kiteapp/common/Common.dart";
import "package:kiteapp/screens/HomePage.dart";
import "package:kiteapp/screens/List.dart";

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kiteSurface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: kiteText,
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            IconButton(
              color: kiteText,
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieList()),
                );
              },
            ),
            IconButton(
              color: kiteText,
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
