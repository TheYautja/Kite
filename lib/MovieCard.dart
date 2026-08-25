import "package:flutter/material.dart";
import "package:kiteapp/Common.dart";
import "package:kiteapp/MoviePlayer.dart";
import "package:kiteapp/Rating.dart";
import "Movie.dart";


class MovieCard extends StatelessWidget
{

    Movie movie;

    MovieCard({required this.movie});

    @override
    Widget build(BuildContext context)
    {
 
        return Card
        (
            color: kiteBack,
            clipBehavior: Clip.antiAlias,
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                    Expanded 
                    (
                        flex: 6,
                        child: Image.network
                        (
                            movie.imgUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress)
                            {
                                if(loadingProgress == null) return child;
                                return const Center
                                (
                                    child: CircularProgressIndicator(),
                                );
                            },
                        ),
                    ),
                    Expanded
                    (
                        flex: 4,
                        child: Padding
                        (
                            padding: const EdgeInsets.all(8),
                            child: Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                [
                                    Text
                                    (
                                        movie.name, 
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),

                                    Spacer(),

                                    Row
                                    (
                                        children: 
                                        [
                                            IconButton
                                            (
                                                onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePlayer(movie: movie,)));
                                                },
                                                icon: Icon(Icons.play_circle),
                                                color: Colors.amber,
                                            ),
                                            Spacer(),
                                            Rating(rating: movie.rating),
                                        ],
                                    ),

                                ],
                            ),
                        )
                    ),
                ],
            )
        );
    }
}

//"https://image.tmdb.org/t/p/w500${movie.imgUrl}"
