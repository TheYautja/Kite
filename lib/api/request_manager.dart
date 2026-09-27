import "package:kiteapp/api/movie_requests.dart";
import "package:kiteapp/api/cache_manager.dart";
import "package:kiteapp/model/movie.dart";


class RequestManager {

    final CacheManager cache = CacheManager();
    final MovieRequests moviesAPI = MovieRequests(); 

    Future<List<Movie>> getMovies(String requestType) async { 
        
        final cacheKey = "movies:$requestType";
        final cached = await cache.getMovies(cacheKey);

        if(cached != null) return cached;

        final movies = await moviesAPI.getMovies(requestType);

        await cache.cacheMovies(cacheKey, movies);

        return movies;
    }

}
