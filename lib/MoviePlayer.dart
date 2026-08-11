import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";


class MoviePlayer extends StatefulWidget
{
    const MoviePlayer({super.key});

    @override
    State<MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer>
{   
    WebViewController controller = WebViewController();

    @override
      initState(){
        controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse("https://vidsrc.to/embed/movie/tt17048514"));           
      }

    @override
      Widget build(BuildContext context) {
       return WebViewWidget(controller: controller);
      }
}

