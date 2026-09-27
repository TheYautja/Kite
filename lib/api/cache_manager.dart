import "package:kiteapp/model/movie.dart";


class CacheManager{
    
    List<Movie> cache = [];

    
    void cacheMovie(Movie movie){
        cache.add(movie);
    }

}
