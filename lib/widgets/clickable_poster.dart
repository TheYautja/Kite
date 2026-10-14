import 'package:flutter/material.dart';
import 'package:kiteapp/widgets/movie_poster.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/screens/movie_player.dart';
import 'package:kiteapp/screens/series_details.dart';

class ClickablePoster extends StatelessWidget {
    final Movie? movie;
    final Series? series;

    const ClickablePoster({
        super.key,
        this.movie,
        this.series,
    });

    @override
    Widget build(BuildContext context) {
        final poster = movie?.imgUrl ?? series?.imgUrl ?? '';

        return InkWell(
            onTap: () {
                if (movie != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MoviePlayer(movie: movie!),
                        ),
                    );
                } else if (series != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SeriesDetails(series: series!),
                        ),
                    );
                }
            },
            child: MoviePoster(path: poster),
        );
    }
}

