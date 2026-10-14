
import 'package:kiteapp/api/movie_requests.dart';
import 'package:kiteapp/api/series_requests.dart';
import 'package:kiteapp/api/cache_manager.dart';
import 'package:kiteapp/model/movie.dart';
import 'package:kiteapp/model/series.dart';

class RequestManager {
    final CacheManager cache = CacheManager();
    final MovieRequests moviesAPI = MovieRequests();
    final SeriesRequests seriesAPI = SeriesRequests();

    Future<List<Movie>> getMovies(String requestType) async {
        final cacheKey = 'movies:$requestType';
        final cached = await cache.getMovies(cacheKey);

        if (cached != null) return cached;

        final movies = await moviesAPI.getMovies(requestType);

        await cache.cacheMovies(cacheKey, movies);

        return movies;
    }

    Future<List<Series>> getSeries(String requestType) async {
        final cacheKey = 'series:$requestType';
        final cached = await cache.getSeries(cacheKey);

        if (cached != null) return cached;

        final series = await seriesAPI.getSeries(requestType);

        await cache.cacheSeries(cacheKey, series);

        return series;
    }
}

