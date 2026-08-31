import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/screens/movie_player.dart';
import 'package:kiteapp/widgets/movie_poster.dart';
import 'package:kiteapp/widgets/rating.dart';
import 'package:kiteapp/widgets/scrollable_text.dart';

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
                        child: InkWell(
                          onTap: (){
                            print("clicked card, debug");
                            Navigator.push(context, MaterialPageRoute(builder: (_) => MoviePlayer(movie: movie)));
                          },
                          child: MoviePoster(path: movie.imgUrl),
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
                                        child: ScrollableText(text: movie.name),
                                    ),

                                    const SizedBox(height: 4),

                                    Row(
                                        children: [
                                            Rating(rating: movie.rating),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                    Navigator.push(context,MaterialPageRoute(builder: (_) => MoviePlayer(movie: movie)));
                                                },
                                                icon: const Icon(
                                                    Icons.play_circle,
                                                ),
                                                color: kitePrimary,
                                                tooltip: 'Watch',
                                                padding: EdgeInsets.zero,
                                                constraints: const BoxConstraints(),
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


