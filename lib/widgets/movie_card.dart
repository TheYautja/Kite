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
        return Card(
            color: kiteSurface,
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(flex: 7, child: ClickablePoster(movie: movie)),
                    Expanded(flex: 3, child: CardBottom(movie: movie)),
                ],
            ),
        );
    }
}


