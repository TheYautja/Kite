
import 'package:flutter/material.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/rating.dart';
import 'package:kiteapp/widgets/add_button.dart';
import 'package:kiteapp/widgets/play_button.dart';
import 'package:kiteapp/widgets/scrollable_text.dart';

class CardBottom extends StatelessWidget {
    final Movie? movie;
    final Series? series;

    const CardBottom({
        super.key,
        this.movie,
        this.series,
    });

    @override
    Widget build(BuildContext context) {
        final name = movie?.name ?? series?.name ?? '';
        final rating = movie?.rating ?? series?.rating ?? 0.0;

        return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ScrollableText(text: name),
                    Row(
                        children: [
                            Rating(
                                rating: rating,
                                colorParam: 'white',
                            ),
                            if (movie != null)
                                AddButton(movie: movie!),
                            const Spacer(),
                            if (movie != null)
                                PlayButton(movie: movie!),
                            if (series != null)
                                const Icon(
                                    Icons.tv_outlined,
                                    color: Colors.white70,
                                    size: 22,
                                ),
                        ],
                    ),
                ],
            ),
        );
    }
}

