import "dart:convert";

import "package:kiteapp/model/movie.dart";
import "package:kiteapp/api/db_helper.dart";

class CacheManager {
  final DbHelper db = DbHelper();


    Future<List<Movie>?> getMovies(String key) async {
        final data = await db.getCache(key);

        if (data == null) {
            return null;
        }

        final decoded = jsonDecode(data) as Map<String, dynamic>;
        final results = decoded["results"] as List<dynamic>;

        return results
        .map(
            (item) => Movie.fromDbResponse(
                item as Map<String, dynamic>,
            ),
        ).toList();
    }



    Future<void> cacheMovies(String key, List<Movie> movies) async {
        final data = jsonEncode({
            "results": movies.map((movie) => movie.toJson()).toList(),
        });

        await db.setCache(key, data);
    }
}

