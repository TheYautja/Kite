import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/card_bottom.dart';
import 'package:kiteapp/widgets/clickable_poster.dart';

class MovieCard extends StatelessWidget {
    final Movie? movie;
    final Series? series;

    const MovieCard({
        super.key,
        this.movie,
        this.series,
    }) : assert(
        (movie == null) != (series == null),
        'Provide either a movie or a series',
    );

    @override
    Widget build(BuildContext context) {
        return Card(
            color: kiteSurface,
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(
                        flex: 5,
                        child: ClickablePoster(
                            movie: movie,
                            series: series,
                        ),
                    ),
                    Expanded(
                        flex: 2,
                        child: CardBottom(
                            movie: movie,
                            series: series,
                        ),
                    ),
                ],
            ),
        );
    }
}

