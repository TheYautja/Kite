import "package:flutter/material.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/widgets/rating.dart";
import "package:kiteapp/widgets/add_button.dart";
import "package:kiteapp/widgets/play_button.dart";
import "package:kiteapp/widgets/scrollable_text.dart";

class CardBottom extends StatelessWidget {

    late final Movie movie;

    CardBottom({required this.movie});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ScrollableText(text: movie.name),
                    Row(
                        children: [
                            Rating(rating: movie.rating),
                            AddButton(movie: movie),
                            PlayButton(movie: movie),
                        ],
                    ),
                ],
            ),
        );
    }

}
