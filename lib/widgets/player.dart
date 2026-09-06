import "package:flutter/material.dart";
import "package:kiteapp/model/movie.dart";
import "package:webview_flutter/webview_flutter.dart";

class Player extends StatelessWidget {
    
    late final int id;

    Player({required this.id});

    @override
    Widget build(BuildContext context) {
        
    WebViewController controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse("https://vsembed.ru/embed/movie/${id}/"))
        ..setNavigationDelegate(
            NavigationDelegate(
                onNavigationRequest: (NavigationRequest request) {
                    if (!request.url.startsWith("https://vsembed.ru/embed/movie")) {
                        return NavigationDecision.prevent;
                    } else {
                        return NavigationDecision.navigate;
                    }
                },
            ),
        );

    return WebViewWidget(controller: controller);

    }



}
