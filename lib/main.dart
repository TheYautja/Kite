import 'package:flutter/material.dart';
import 'dart:io';
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sqflite_common_ffi/sqflite_ffi.dart";
import "package:kiteapp/screens/homepage.dart";

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    
    if(Platform.isLinux){
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
    }

    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
}
