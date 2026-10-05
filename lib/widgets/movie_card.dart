import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/widgets/card_bottom.dart';
import 'package:kiteapp/widgets/clickable_poster.dart';


class MovieCard extends StatelessWidget {
    
    final Movie movie;

    const MovieCard({required this.movie});

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 285,
            child: Card(
                color: kiteSurface,
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Expanded(flex: 5, child: ClickablePoster(movie: movie)),
                        Expanded(flex: 2, child: CardBottom(movie: movie)),
                    ],
                ),
            ),
        );
    }
}


