
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/movie_card.dart';

class CarouselList extends StatelessWidget {
    final List<Movie> top;
    final List<Movie> popular;
    final List<Movie> upcoming;

    final List<Series> topSeries;
    final List<Series> popularSeries;
    final List<Series> airingSeries;

    final bool showSeries;

    const CarouselList({
        super.key,
        this.top = const [],
        this.popular = const [],
        this.upcoming = const [],
        this.topSeries = const [],
        this.popularSeries = const [],
        this.airingSeries = const [],
        this.showSeries = false,
    });

    Widget buildSection(
        String title,
        int count,
        Widget Function(int) itemBuilder,
    ) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kiteText,
                        ),
                    ),
                ),
                SizedBox(
                    height: 285,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemExtent: 170,
                        itemCount: count,
                        itemBuilder: (context, index) {
                            return itemBuilder(index);
                        },
                    ),
                ),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return ListView(
            children: showSeries
                ? [
                    buildSection(
                        'Top Rated',
                        topSeries.length,
                        (index) => MovieCard(
                            series: topSeries[index],
                        ),
                    ),
                    buildSection(
                        'Popular',
                        popularSeries.length,
                        (index) => MovieCard(
                            series: popularSeries[index],
                        ),
                    ),
                    buildSection(
                        'On The Air',
                        airingSeries.length,
                        (index) => MovieCard(
                            series: airingSeries[index],
                        ),
                    ),
                ]
                : [
                    buildSection(
                        'Top Rated',
                        top.length,
                        (index) => MovieCard(
                            movie: top[index],
                        ),
                    ),
                    buildSection(
                        'Popular',
                        popular.length,
                        (index) => MovieCard(
                            movie: popular[index],
                        ),
                    ),
                    buildSection(
                        'Upcoming',
                        upcoming.length,
                        (index) => MovieCard(
                            movie: upcoming[index],
                        ),
                    ),
                ],
        );
    }
}

