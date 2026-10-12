import 'package:kiteapp/api/db_helper.dart';
import "package:path_provider/path_provider.dart";
import "dart:io";

class ConfigUtils {

    void _write(String contents, String filename) async {
        final Directory dir = await getApplicationDocumentsDirectory();
        final File file = File('${dir}/${filename}.txt');
        await file.writeAsString(contents);
    }

    Future<String> _read(String filename) async {
        late String text;
        try {
            final Directory dir = await getApplicationDocumentsDirectory();
            final File file = File('${dir}/${filename}.txt');
            text = await file.readAsString();
        }
        catch (e) {
            print("could not read file");
        }
        return text;
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
