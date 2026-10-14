
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/api/request_manager.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/screens/tmdb_search.dart';
import 'package:kiteapp/widgets/bottom_nav.dart';
import 'package:kiteapp/widgets/carousel_list.dart';

class Homepage extends StatefulWidget {
    const Homepage({super.key});

    @override
    State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    final RequestManager api = RequestManager();

    bool showSeries = false;

    late Future<List<List<Movie>>> movies;
    Future<List<List<Series>>>? series;

    @override
    void initState() {
        super.initState();
        movies = loadAllMovies();
    }

    Future<List<List<Movie>>> loadAllMovies() async {
        return Future.wait([
            api.getMovies('top_rated'),
            api.getMovies('popular'),
            api.getMovies('upcoming'),
        ]);
    }

    Future<List<List<Series>>> loadAllSeries() async {
        return Future.wait([
            api.getSeries('top_rated'),
            api.getSeries('popular'),
            api.getSeries('on_the_air'),
        ]);
    }

    void changeMedia(bool value) {
        if (showSeries == value) return;

        setState(() {
            showSeries = value;

            if (showSeries) {
                series ??= loadAllSeries();
            }
        });
    }

    Widget buildSelector() {
        return Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: kiteSurface,
                borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                children: [
                    buildTab(
                        title: 'Movies',
                        icon: Icons.movie_outlined,
                        selected: !showSeries,
                        onTap: () => changeMedia(false),
                    ),
                    buildTab(
                        title: 'Series',
                        icon: Icons.tv_outlined,
                        selected: showSeries,
                        onTap: () => changeMedia(true),
                    ),
                ],
            ),
        );
    }

    Widget buildTab({
        required String title,
        required IconData icon,
        required bool selected,
        required VoidCallback onTap,
    }) {
        return Expanded(
            child: Material(
                color: selected ? kitePrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(
                                    icon,
                                    size: 20,
                                    color: selected
                                        ? kiteText
                                        : kiteTextSecondary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                    title,
                                    style: TextStyle(
                                        color: selected
                                            ? kiteText
                                            : kiteTextSecondary,
                                        fontWeight: FontWeight.w600,
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }

    Widget buildMovies() {
        return FutureBuilder<List<List<Movie>>>(
            future: movies,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: kitePrimary,
                        ),
                    );
                }

                if (snapshot.hasError) {
                    return buildError(
                        snapshot.error.toString(),
                        () {
                            setState(() {
                                movies = loadAllMovies();
                            });
                        },
                    );
                }

                if (!snapshot.hasData) {
                    return const Center(
                        child: Text(
                            'No movies available',
                            style: TextStyle(color: kiteTextSecondary),
                        ),
                    );
                }

                final results = snapshot.data!;

                return CarouselList(
                    top: results[0],
                    popular: results[1],
                    upcoming: results[2],
                );
            },
        );
    }

    Widget buildSeries() {
        return FutureBuilder<List<List<Series>>>(
            future: series,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: kitePrimary,
                        ),
                    );
                }

                if (snapshot.hasError) {
                    return buildError(
                        snapshot.error.toString(),
                        () {
                            setState(() {
                                series = loadAllSeries();
                            });
                        },
                    );
                }

                if (!snapshot.hasData) {
                    return const Center(
                        child: Text(
                            'No series available',
                            style: TextStyle(color: kiteTextSecondary),
                        ),
                    );
                }

                final results = snapshot.data!;

                return CarouselList(
                    showSeries: true,
                    topSeries: results[0],
                    popularSeries: results[1],
                    airingSeries: results[2],
                );
            },
        );
    }

    Widget buildError(String message, VoidCallback retry) {
        return Center(
            child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        const Icon(
                            Icons.error_outline,
                            color: kiteError,
                            size: 40,
                        ),
                        const SizedBox(height: 12),
                        Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: kiteTextSecondary,
                            ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: retry,
                            child: const Text('Retry'),
                        ),
                    ],
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kiteBackground,
            appBar: AppBar(
                title: const Text('Kite'),
                backgroundColor: kiteSurface,
                foregroundColor: kiteText,
                actions: [
                    IconButton(
                        tooltip: 'Search',
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TmdbSearchPage(initialSeries: showSeries,),
                                ),
                            );
                        },
                        icon: const Icon(Icons.search),
                    ),
                ],
            ),
            body: Column(
                children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: buildSelector(),
                    ),
                    Expanded(
                        child: showSeries
                            ? buildSeries()
                            : buildMovies(),
                    ),
                ],
            ),
            bottomNavigationBar: BottomNav(),
        );
    }
}

