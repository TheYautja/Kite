import "package:kiteapp/api/db_helper.dart";
import "package:kiteapp/api/movie_requests.dart";
import "package:kiteapp/api/cache_manager.dart";
import "package:kiteapp/model/movie.dart";


class RequestManager {

    final CacheManager cache = CacheManager();
    final MovieRequests moviesAPI = MovieRequests();
    final DbHelper db = DbHelper(); 

    
    Future<List<Movie>> getMovies(String requestType){
       
        if(1 == 1){
            return moviesAPI.getMovies(requestType);
        } else {
            return moviesAPI.getMovies(requestType);
        }
    }
}
