import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MoviePlayer extends StatefulWidget {
  const MoviePlayer({super.key});

  @override
  State<MoviePlayer> createState() => _MoviePlayerState();
}


class _MoviePlayerState extends State<MoviePlayer> {
  
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: WebView(
        initialUrl: 'https://vidsrc.to/embed/movie/tt17048515',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
      ),
    );
  }
}
