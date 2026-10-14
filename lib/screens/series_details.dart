
import 'package:flutter/material.dart';
import 'package:kiteapp/api/series_requests.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/player.dart';
import 'package:kiteapp/widgets/rating.dart';

class SeriesDetails extends StatefulWidget {
    final Series series;

    const SeriesDetails({
        super.key,
        required this.series,
    });

    @override
    State<SeriesDetails> createState() => _SeriesDetailsState();
}

class _SeriesDetailsState extends State<SeriesDetails> {
    late Future<Series> details;

    int? selectedSeason;
    int selectedEpisode = 1;

    @override
    void initState() {
        super.initState();
        details = SeriesRequests().getDetails(widget.series.id);
    }

    Widget buildSelector({
        required String label,
        required int value,
        required List<int> options,
        required ValueChanged<int?> onChanged,
    }) {
        return DropdownButtonFormField<int>(
            key: ValueKey('$label-$value'),
            initialValue: value,
            dropdownColor: kiteSurfaceLight,
            style: const TextStyle(color: kiteText),
            decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                    color: kiteTextSecondary,
                ),
                filled: true,
                fillColor: kiteSurface,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                ),
            ),
            items: options.map((number) {
                return DropdownMenuItem<int>(
                    value: number,
                    child: Text(
                        label == 'Season'
                            ? 'Season $number'
                            : 'Episode $number',
                    ),
                );
            }).toList(),
            onChanged: onChanged,
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kiteBackground,
            appBar: AppBar(
                title: Text(widget.series.name),
                backgroundColor: kiteSurface,
                foregroundColor: kiteText,
            ),
            body: FutureBuilder<Series>(
                future: details,
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(),
                        );
                    }

                    if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}',
                                style: const TextStyle(color: kiteError),
                            ),
                        );
                    }

                    if (!snapshot.hasData) {
                        return const Center(
                            child: Text('Series not found'),
                        );
                    }

                    final series = snapshot.data!;

                    final seasons = series.seasons
                        .where((season) => season.seasonNumber > 0)
                        .toList()
                        ..sort(
                            (a, b) => a.seasonNumber.compareTo(b.seasonNumber),
                        );

                    if (seasons.isEmpty) {
                        return const Center(
                            child: Text(
                                'No seasons available',
                                style: TextStyle(color: kiteText),
                            ),
                        );
                    }

                    final seasonNumbers = seasons
                        .map((season) => season.seasonNumber)
                        .toList();

                    final currentSeason = seasonNumbers.contains(selectedSeason)
                        ? selectedSeason!
                        : seasonNumbers.first;

                    final season = seasons.firstWhere(
                        (item) => item.seasonNumber == currentSeason,
                    );

                    final episodeCount = season.episodeCount;
                    final episodeNumbers = List<int>.generate(
                        episodeCount,
                        (index) => index + 1,
                    );

                    final currentEpisode = selectedEpisode >= 1 &&
                            selectedEpisode <= episodeCount
                        ? selectedEpisode
                        : 1;

                    return ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                            AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Player(
                                        id: series.id,
                                        isSeries: true,
                                        season: currentSeason,
                                        episode: currentEpisode,
                                    ),
                                ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                                series.name,
                                style: const TextStyle(
                                    color: kiteText,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),

                            const SizedBox(height: 8),

                            Rating(
                                rating: series.rating,
                                colorParam: 'white',
                            ),

                            const SizedBox(height: 20),

                            Row(
                                children: [
                                    Expanded(
                                        child: buildSelector(
                                            label: 'Season',
                                            value: currentSeason,
                                            options: seasonNumbers,
                                            onChanged: (value) {
                                                if (value == null) return;

                                                setState(() {
                                                    selectedSeason = value;
                                                    selectedEpisode = 1;
                                                });
                                            },
                                        ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                        child: buildSelector(
                                            label: 'Episode',
                                            value: currentEpisode,
                                            options: episodeNumbers,
                                            onChanged: (value) {
                                                if (value == null) return;

                                                setState(() {
                                                    selectedEpisode = value;
                                                });
                                            },
                                        ),
                                    ),
                                ],
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
                    );
                },
            ),
        );
    }
}

