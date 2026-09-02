import 'package:flutter/material.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sqflite_common_ffi/sqflite_ffi.dart";
import "package:kiteapp/screens/homepage.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
}
