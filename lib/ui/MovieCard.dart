import "package:flutter/material.dart";

class MovieCard extends StatelessWidget
{
    @override
      Widget build(BuildContext context) {
        return Container(
            child: Row(
                children: [
                    ClipRRect( child: Image.asset("images/placeholder.jpg")),
                ]
            ),
        );
      }
}
