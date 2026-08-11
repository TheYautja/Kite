import 'package:flutter/material.dart';
import "package:webview_flutter/webview_flutter.dart";
import "HomePage.dart";

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();

    //await WebViewPlatform.instance.initialize();

    runApp(MaterialApp(home: Homepage(),));
}

