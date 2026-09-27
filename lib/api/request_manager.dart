import "package:kiteapp/api/movie_requests.dart";
import "package:kiteapp/api/cache_manager.dart";
import "package:kiteapp/model/movie.dart";


class RequestManager {

    late final CacheManager cache;
    late final MovieRequests moviesAPI;
    late final DbHelper db;


    RequestManager({required this.cache, required this.moviesAPI, required this.db});

    
    Future<List<Movie>> getMovies(String requestType){
       
        if(1 == 1){
            return moviesAPI.getMovies(requestType);
        } else {
            return moviesAPI.getMovies(requestType);
        }
    }
}
