import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";
import "package:flutter_linux_webview/flutter_linux_webview.dart";


class MoviePlayer extends StatefulWidget
{
    const MoviePlayer({super.key});
    late WebViewController controller; 

    @override
    State<MoviePlayer> createState() => _MoviePlayerState();}

class _MoviePlayerState extends State<MoviePlayer>
{   
    WebViewController controller = WebViewController();

    @override
      super.initState()

    }

    @override
      Widget build(BuildContext context) {
       return Scaffold(
            appBar: AppBar(title: Text("test")),
            body: WebView(
                initialUrl: "https://vidsrc.to/embed/movie/tt17048515",
                onWebViewCreated: (WebViewController webViewController) {
                    controller:  
                    JavascriptMode: JavascriptMode.unrestricted,
                },
            ),
       )
      }
}

