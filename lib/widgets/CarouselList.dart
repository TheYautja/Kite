import 'package:flutter/material.dart';
import "package:kiteapp/api/API.dart";
import "package:kiteapp/model/Movie.dart";
import "package:kiteapp/model/Series.dart";
import "package:kiteapp/widgets/MovieCard.dart";

class CarouselList extends StatefulWidget{

    late List<Movie> top;
    late List<Movie> popular;
    late List<Movie> upcoming;
    late String type;

    CarouselList({
        required this.top,
        required this.popular,
        required this.upcoming,
        required this.type
    });

    @override
    State<CarouselList> createState() => _CarouselListState();

}

class _CarouselListState extends State<CarouselList> {

    @override
    Widget build (BuildContext context) {
        return Expanded(
            child: Column(
                children: [
                    Text("Top Rated"),
                    Expanded(
                        child: CarouselView(
                            itemExtent: double.infinity,
                            children: List<Widget>.generate(
                                widget.top.length,
                                (int index){
                                    return MovieCard(movie: widget.top[index]);
                                }
                            ),
                        ),
                    ),
                    Text("Popular"),
                    Expanded(
                        child: CarouselView(
                            itemExtent: double.infinity,
                            children: List<Widget>.generate(
                                widget.popular.length,
                                (int index){
                                    return MovieCard(movie: widget.popular[index]);
                                }
                            ),
                        ),
                    ),
                    Text("Upcoming"),
                    Expanded(
                        child: CarouselView(
                            itemExtent: double.infinity,
                            children: List<Widget>.generate(
                                widget.upcoming.length,
                                (int index){
                                    return MovieCard(movie: widget.upcoming[index]);
                                }
                            ),
                        ),
                    ),
                ]
            ),
        );
    }
}
