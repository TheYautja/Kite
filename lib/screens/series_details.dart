
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/movie_poster.dart';
import 'package:kiteapp/widgets/rating.dart';

class SeriesDetails extends StatelessWidget {
    final Series series;

    const SeriesDetails({
        super.key,
        required this.series,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kiteBackground,
            appBar: AppBar(
                title: Text(series.name),
                backgroundColor: kiteSurface,
                foregroundColor: kiteText,
            ),
            body: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                    Center(
                        child: SizedBox(
                            width: 200,
                            height: 300,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: MoviePoster(path: series.imgUrl),
                            ),
                        ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                        series.name,
                        style: const TextStyle(
                            color: kiteText,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Center(
                        child: Rating(
                            rating: series.rating,
                            colorParam: 'white',
                        ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                        'First aired: ${series.date}',
                        style: const TextStyle(
                            color: kiteTextSecondary,
                            fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                        'Overview',
                        style: TextStyle(
                            color: kiteText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        series.description,
                        style: const TextStyle(
                            color: kiteTextSecondary,
                            fontSize: 15,
                            height: 1.5,
                        ),
                    ),
                ],
            ),
        );
    }
}

