import "package:sqflite/sqflite.dart";

class SqfLite {
    
   void initDB(){
        var dbPath = getDatabasesPath();
        String path = join(dbPath, "userMovies.db");

        Database db = await openDatabase(path, version: 1,
            onCreate: (Database database, int version)
        )
   } 

}
