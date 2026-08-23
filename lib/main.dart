import 'package:flutter/material.dart';
import "HomePage.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    runApp(MaterialApp(home: Homepage(),));

}

