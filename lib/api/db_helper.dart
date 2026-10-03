import "package:sqflite/sqflite.dart";
import "package:kiteapp/model/movie.dart";


class DbHelper {

    //singleton
    static final DbHelper _helper = DbHelper._internal();
    static Database? _database;

    factory DbHelper(){
        return _helper;
    }

    DbHelper._internal();


    Future<Database> get db async {
        _database ??= await initDb();
        return _database!;
    }


Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/userMovies.db";

    print("DB PATH: $path");

    return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
    );
}


    Future _onCreate(Database db, int version) async {
        await db.execute(''' 
            CREATE TABLE user_movies(
                id INTEGER PRIMARY KEY,
                name TEXT,
                date TEXT,
                rating DECIMAL,
                imgUrl TEXT,
                description TEXT
            ) 
        ''');

        await db.execute('''
            CREATE TABLE cache(
                key TEXT PRIMARY KEY,
                cached_at INTEGER,
                data TEXT NOT NULL
            )
        ''');
    }


    Future<int> insertMovie(Movie movie, String table) async {
        Database db = await _helper.db;

        Map<String, dynamic> row = movie.toJson();

        return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
    }


    Future<int> deleteMovieById(List<int> args, String table) async {
        Database db = await _helper.db;
        return await db.delete(table, where: "id = ?", whereArgs: args);
    }


    Future<List<Movie>> getAllMovies() async {
        Database db = await _helper.db;
        var result = await db.rawQuery("SELECT * FROM user_movies");

        return result.map((row) => Movie.fromDbResponse(row)).toList();
    }


    Future<void> setCache(String key, String data) async {
        Database db = await _helper.db;

        await db.insert("cache", 
        {
            "key": key,
            "data": data,
            "cached_at": DateTime.now().millisecondsSinceEpoch,
        },
            conflictAlgorithm: ConflictAlgorithm.replace,
        );
    }


    Future<String?> getCache(String key, {Duration ttl = const Duration(hours: 6),}) async {
        Database db = await _helper.db;

        final result = await db.query(
            "cache",
            where: "key = ?",
            whereArgs: [key],
            limit: 1,
        );

        if(result.isEmpty) return null;

        final row = result.first;

        final cachedAt = DateTime.fromMillisecondsSinceEpoch(row["cached_at"] as int,);

        if(DateTime.now().difference(cachedAt) > ttl) return null;
        
        return row["data"] as String;
    }


}
