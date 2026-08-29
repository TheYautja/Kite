import 'package:flutter/material.dart';
import "package:kiteapp/api/API.dart";
import "package:kiteapp/model/Movie.dart";
import "package:kiteapp/model/Series.dart";

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
                        child: CarouselView(itemExtent: widget.top.length.toDouble(), children: [])
                    ),
                    Text("Popular"),
                    Expanded(
                        child: CarouselView(itemExtent: widget.popular.length.toDouble(), children: [])
                    ),
                    Text("Upcoming"),
                    Expanded(
                        child: CarouselView(itemExtent: widget.upcoming.length.toDouble(), children: []),
                    ),
                ]
            ),
        );
    }
}
