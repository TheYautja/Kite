import 'package:flutter/material.dart';
import "package:webview_flutter/webview_flutter.dart";
import 'package:flutter_linux_webview/flutter_linux_webview.dart';
import "HomePage.dart";

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
    LinuxWebViewPlugin.initialize();
    WebView.platform = LinuxWebView();
    

    runApp(MaterialApp(home: Homepage(),));
}

