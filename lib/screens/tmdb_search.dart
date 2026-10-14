
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';
import 'package:kiteapp/api/movie_requests.dart';
import 'package:kiteapp/api/series_requests.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';
import 'package:kiteapp/widgets/movie_card.dart';

class TmdbSearchPage extends StatefulWidget {
    final bool initialSeries;

    const TmdbSearchPage({
        super.key,
        this.initialSeries = false,
    });

    @override
    State<TmdbSearchPage> createState() => _TmdbSearchPageState();
}

class _TmdbSearchPageState extends State<TmdbSearchPage> {
    final MovieRequests movieApi = MovieRequests();
    final SeriesRequests seriesApi = SeriesRequests();

    final TextEditingController searchController = TextEditingController();

    late bool showSeries;

    Future<List<Movie>>? movieResults;
    Future<List<Series>>? seriesResults;

    @override
    void initState() {
        super.initState();
        showSeries = widget.initialSeries;
    }

    @override
    void dispose() {
        searchController.dispose();
        super.dispose();
    }

    void search() {
        final query = searchController.text.trim();

        if (query.isEmpty) return;

        FocusScope.of(context).unfocus();

        setState(() {
            if (showSeries) {
                seriesResults = seriesApi.searchByName(query);
            } else {
                movieResults = movieApi.searchByName(query);
            }
        });
    }

    void changeMedia(bool value) {
        if (showSeries == value) return;

        setState(() {
            showSeries = value;
        });

        if (searchController.text.trim().isNotEmpty) {
            search();
        }
    }

    Widget buildSelector() {
        return Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: kiteSurface,
                borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                children: [
                    buildTab('Movies', Icons.movie_outlined, false),
                    buildTab('Series', Icons.tv_outlined, true),
                ],
            ),
        );
    }

    Widget buildTab(String title, IconData icon, bool isSeries) {
        final selected = showSeries == isSeries;

        return Expanded(
            child: Material(
                color: selected ? kitePrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => changeMedia(isSeries),
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

    Widget buildGrid({
        required int count,
        required Widget Function(int) itemBuilder,
    }) {
        if (count == 0) {
            return const Center(
                child: Text(
                    'No results found',
                    style: TextStyle(color: kiteTextSecondary),
                ),
            );
        }

        return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.60,
            ),
            itemCount: count,
            itemBuilder: (context, index) {
                return itemBuilder(index);
            },
        );
    }

    Widget buildMovies() {
        if (movieResults == null) {
            return buildEmptyState();
        }

        return FutureBuilder<List<Movie>>(
            future: movieResults,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: kitePrimary,
                        ),
                    );
                }

                if (snapshot.hasError) {
                    return buildError(snapshot.error.toString());
                }

                final movies = snapshot.data ?? [];

                return buildGrid(
                    count: movies.length,
                    itemBuilder: (index) {
                        return MovieCard(movie: movies[index]);
                    },
                );
            },
        );
    }

    Widget buildSeries() {
        if (seriesResults == null) {
            return buildEmptyState();
        }

        return FutureBuilder<List<Series>>(
            future: seriesResults,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: kitePrimary,
                        ),
                    );
                }

                if (snapshot.hasError) {
                    return buildError(snapshot.error.toString());
                }

                final series = snapshot.data ?? [];

                return buildGrid(
                    count: series.length,
                    itemBuilder: (index) {
                        return MovieCard(series: series[index]);
                    },
                );
            },
        );
    }

    Widget buildEmptyState() {
        return Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Icon(
                        Icons.search,
                        size: 48,
                        color: kiteTextSecondary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                        showSeries
                            ? 'Search for TV series'
                            : 'Search for movies',
                        style: const TextStyle(
                            color: kiteTextSecondary,
                            fontSize: 16,
                        ),
                    ),
                ],
            ),
        );
    }

    Widget buildError(String message) {
        return Center(
            child: Padding(
                padding: const EdgeInsets.all(20),
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
                            onPressed: search,
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
                backgroundColor: kiteSurface,
                foregroundColor: kiteText,
                title: TextField(
                    controller: searchController,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    style: const TextStyle(color: kiteText),
                    onSubmitted: (_) => search(),
                    decoration: InputDecoration(
                        hintText: 'Search by title',
                        hintStyle: const TextStyle(
                            color: kiteTextSecondary,
                        ),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            icon: const Icon(
                                Icons.search,
                                color: kiteText,
                            ),
                            onPressed: search,
                        ),
                    ),
                ),
            ),
            body: Column(
                children: [
                    buildSelector(),
                    Expanded(
                        child: showSeries
                            ? buildSeries()
                            : buildMovies(),
                    ),
                ],
            ),
        );
    }
}

