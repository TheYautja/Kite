import "dart:convert";

import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class CacheManager{
    
    final DbHelper db = DbHelper();
    
    Future<List<Movie>?> getMovies(String key) async {
        
        final data = await db.getCache(key);
        
        if(data == null)return null;

        final json = jsonDecode(data);

        return MovieResponse.fromJson(json).response;
    }

    
    Future<void> cacheMovies(String key, List<Movie> movies) async {
        
        final data = jsonEncode({"results": movies.map((movie) => movie.toJson()).toList()});

        await db.setCache(key, data);
    }

}
