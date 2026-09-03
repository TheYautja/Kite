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


    Future<Database> initDb () async {

        String dbPath = await getDatabasesPath();
        String path = "${dbPath}userMovies.db";

        return await openDatabase(path, version: 1, onCreate: _onCreate);
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
    }


    Future<int> insertMovie(Movie movie) async {
        Database db = await _helper.db;

        Map<String, dynamic> row = movie.toJson();

        return await db.insert("user_movies", row, conflictAlgorithm: ConflictAlgorithm.replace);
    }


    Future<int> deleteMovieById(List<int> args) async {
        Database db = await _helper.db;
        return await db.delete("user_movies", where: "id = ?", whereArgs: args);
    }


    Future<List> getAllMovies() async {
        Database db = await _helper.db;
        var result = await db.rawQuery("SELECT * FROM user_movies");

        return result.toList();
    }


}
