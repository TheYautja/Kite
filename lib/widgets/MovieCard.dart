import 'package:flutter/material.dart';

import 'package:kiteapp/common/Common.dart';
import 'package:kiteapp/model/Movie.dart';
import 'package:kiteapp/screens/MoviePlayer.dart';
import 'package:kiteapp/widgets/Rating.dart';
import 'package:marquee/marquee.dart';

class MovieCard extends StatelessWidget {
    final Movie movie;

    const MovieCard({
        super.key,
        required this.movie,
    });

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
                        flex: 7,
                        child: movie.imgUrl.isEmpty
                            ? const Center(
                                child: Icon(
                                    Icons.movie_outlined,
                                    size: 40,
                                    color: kiteTextSecondary,
                                ),
                            )
                            : Image.network(
                                movie.imgUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                ) {
                                    if (loadingProgress == null) {
                                        return child;
                                    }

                                    return const Center(
                                        child: CircularProgressIndicator(),
                                    );
                                },
                                errorBuilder: (
                                    context,
                                    error,
                                    stackTrace,
                                ) {
                                    return const Center(
                                        child: Icon(
                                            Icons.broken_image_outlined,
                                            size: 40,
                                            color: kiteTextSecondary,
                                        ),
                                    );
                                },
                            ),
                    ),

                    Expanded(
                        flex: 3,
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Expanded(
                                        child: Marquee(
                                            text: movie.name,
                                            style: const TextStyle(
                                                color: kiteText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                            ),
                                            scrollAxis: Axis.horizontal,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            blankSpace: 40.0,
                                            velocity: 30.0,
                                            pauseAfterRound: Duration(seconds: 2),
                                            startPadding: 0,
                                            accelerationDuration: Duration(milliseconds: 500),
                                            decelerationDuration: Duration(milliseconds: 500),
                                        )
                                    ),

                                    const SizedBox(height: 4),

                                    Row(
                                        children: [
                                            Rating(
                                                rating: movie.rating,
                                            ),

                                            const Spacer(),

                                            IconButton(
                                                onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                MoviePlayer(
                                                                    movie: movie,
                                                                ),
                                                        ),
                                                    );
                                                },
                                                icon: const Icon(
                                                    Icons.play_circle,
                                                ),
                                                color: kitePrimary,
                                                tooltip: 'Watch',
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}


