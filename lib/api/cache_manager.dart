import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class CacheManager{
    
    void cacheMovie(Movie movie){
        cache.add(movie);
    }

}
