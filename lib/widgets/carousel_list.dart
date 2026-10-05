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
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            children: top.map((movie) {
                                return MovieCard(movie: movie);
                            }).toList(),
                        ),
                    ),

                    const Text(
                        "Popular",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kiteSurface),
                    ),

                    SizedBox(
                        height: 285,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            children: popular.map((movie) {
                                return MovieCard(movie: movie);
                            }).toList(),
                        ),
                    ),

                    const Text(
                        "Upcoming",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kiteSurface),
                    ),

                    SizedBox(
                        height: 285,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 170,
                            children: upcoming.map((movie) {
                                return MovieCard(movie: movie);
                            }).toList(),
                        ),
                    ),
                ],
            ),
        );
    }
}
