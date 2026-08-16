import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MoviePlayer extends StatefulWidget {
    const MoviePlayer({super.key});

    @override
    State<MoviePlayer> createState() => _MoviePlayerState();
}


class _MoviePlayerState extends State<MoviePlayer> {
  
    late final WebViewController controller;

    @override
    void initState()
    {
        super.initState();

        controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse("https://vidsrc.to/embed/movie/tt17048515"));

    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Test'),
            ),
            body: WebViewWidget(controller: controller),
        );
    }
}
