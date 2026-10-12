import 'package:kiteapp/api/db_helper.dart';
import "package:path_provider/path_provider.dart";
import "dart:io";

class ConfigUtils {

    void _write(String contents, String filename) async {
        final Directory dir = await getApplicationDocumentsDirectory();
        final File file = File('${dir}/${filename}.txt');
        await file.writeAsString(contents);
    }

    void _read(String filename) async {
        try {
            final Directory dir = await getApplicationDocumentsDirectory();
            final File file = File('${dir}/${filename}.txt');
            final String text = await file.readAsString();
            //parse and write to db
        }
        catch (e) {
            print("could not read file");
        }
    }

    void exportToFile(String filename) async {

        DbHelper db = DbHelper();
        final movies = await db.getAllMovies();
        _write(movies.toString(), filename);

    }

    void importFromFile(String filename){
        DbHelper db = DbHelper();
        final text = _read(filename);
        
    }

}
