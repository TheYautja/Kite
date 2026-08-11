import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

class Movieplayer extends StatelessWidget
{   

    WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://vidsrc.to/embed/movie/tt17048514"));

    @override
      Widget build(BuildContext context) {
       return WebViewWidget(controller: controller);
      }
}

