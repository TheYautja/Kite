import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/screens/movie_player.dart';
import 'package:kiteapp/widgets/movie_poster.dart';
import 'package:kiteapp/widgets/play_button.dart';
import 'package:kiteapp/widgets/rating.dart';
import 'package:kiteapp/widgets/scrollable_text.dart';
import 'package:kiteapp/widgets/add_button.dart';

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

                                    ScrollableText(text: movie.name),

                                    const SizedBox(height: 4),

                                    Row(
                                        children: [
                                            Rating(rating: movie.rating),
                                            const Spacer(),
                                            AddButton(movie: movie),
                                            const Spacer(),
                                            PlayButton(movie: movie),
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


