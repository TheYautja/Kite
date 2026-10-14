

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
        List<Widget> cards,
    ) {
        if (cards.isEmpty) return const SizedBox.shrink();

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
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                            return cards[index];
                        },
                    ),
                ),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        final sections = showSeries
            ? [
                (
                    'Top Rated',
                    topSeries.map((series) {
                        return MovieCard(series: series);
                    }).toList(),
                ),
                (
                    'Popular',
                    popularSeries.map((series) {
                        return MovieCard(series: series);
                    }).toList(),
                ),
                (
                    'On The Air',
                    airingSeries.map((series) {
                        return MovieCard(series: series);
                    }).toList(),
                ),
            ]
            : [
                (
                    'Top Rated',
                    top.map((movie) {
                        return MovieCard(movie: movie);
                    }).toList(),
                ),
                (
                    'Popular',
                    popular.map((movie) {
                        return MovieCard(movie: movie);
                    }).toList(),
                ),
                (
                    'Upcoming',
                    upcoming.map((movie) {
                        return MovieCard(movie: movie);
                    }).toList(),
                ),
            ];

        return ListView(
            padding: const EdgeInsets.only(bottom: 20),
            children: [
                for (final section in sections)
                    buildSection(section.$1, section.$2),
            ],
        );
    }
}

