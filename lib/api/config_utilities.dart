
import 'dart:convert';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kiteapp/api/db_helper.dart';
import 'package:kiteapp/model/movie.dart';

class ConfigUtils {
  final DbHelper db = DbHelper();

  Future<String?> exportToFile() async {
    final movies = await db.getAllMovies();

    final backup = {
      'version': 1,
      'movies': movies.map((movie) => movie.toJson()).toList(),
    };

    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Export movie library',
      fileName: 'kite_backup.json',
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (path == null) return null;

    final file = File(path);
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(backup),
      flush: true,
    );

    return file.path;
  }

  Future<int?> importFromFile() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Import movie library',
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: false,
    );

    if (result == null) return null;

    final path = result.files.single.path;

    if (path == null) {
      throw const FormatException('Unable to access selected file');
    }

    final contents = await File(path).readAsString();
    final decoded = jsonDecode(contents);

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid backup format');
    }

    if (decoded['version'] != 1) {
      throw const FormatException('Unsupported backup version');
    }

    final entries = decoded['movies'];

    if (entries is! List) {
      throw const FormatException('Missing movie list');
    }

    final movies = entries.map((entry) {
      if (entry is! Map<String, dynamic>) {
        throw const FormatException('Invalid movie entry');
      }

      if (entry['id'] is! int ||
          entry['name'] is! String ||
          entry['date'] is! String ||
          entry['rating'] is! num ||
          entry['imgUrl'] is! String ||
          entry['description'] is! String) {
        throw const FormatException('Invalid movie fields');
      }

      return Movie.fromDbResponse(entry);
    }).toList();

    final database = await db.db;

    await database.transaction((txn) async {
      final batch = txn.batch();

      for (final movie in movies) {
        batch.insert(
          'user_movies',
          movie.toJson(),
          conflictAlgorithm:
              ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
    });

    return movies.length;
  }
}

