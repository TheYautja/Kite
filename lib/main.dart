import 'package:flutter/material.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:kiteapp/screens/HomePage.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
}
