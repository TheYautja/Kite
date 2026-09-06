import "package:flutter/material.dart";
import "package:kiteapp/widgets/rating.dart";
import "package:kiteapp/model/movie.dart";


class MovieData extends StatelessWidget {
    
    late final Movie movie;

    MovieData({required this.movie});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        movie.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                        movie.date.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Rating(rating: movie.rating),
                    Text(movie.description),
                    Spacer(),
                ],
            ),
        );
    }

}
