import 'package:flutter/material.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/widgets/movie_card.dart';

class CarouselList extends StatelessWidget {

    final List<Movie> top;
    final List<Movie> popular;
    final List<Movie> upcoming ;

    const CarouselList({
        super.key,
        required this.top,
        required this.popular,
        required this.upcoming,
    });

    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: ListView(
                children: [
                    const Text(
                        "Top Rated",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kiteSurface),
                    ),

                    SizedBox(
                        height: 285,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            itemCount: top.length,
                            itemBuilder: (context, index){
                                return MovieCard(movie: top[index]);
                            }, 
                        ),
                    ),

                    const Text(
                        "Popular",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kiteSurface),
                    ),

                    SizedBox(
                        height: 285,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            itemCount: popular.length,
                            itemBuilder: (context, index){
                                return MovieCard(movie: popular[index]);
                            }
                        ),
                    ),

                    const Text(
                        "Upcoming",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kiteSurface),
                    ),

                    SizedBox(
                        height: 285,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            itemCount: upcoming.length,
                            itemBuilder: (context, index){
                                return MovieCard(movie: upcoming[index]);
                            },
                        ),
                    ),
                ],
            ),
        );
    }
}
