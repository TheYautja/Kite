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
        String path = join(dbPath, "userMovies.db");

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
                description TEXT,
            ) 
        ''');
    }


    Future<int> insertMovie(Movie movie) async {
        Database db = await _helper.db;
        return await db.insert("user_movies", movie.toMap());
    }


}
