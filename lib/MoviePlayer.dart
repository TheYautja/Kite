import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MoviePlayer extends StatefulWidget 
{
    const MoviePlayer({super.key});

    @override
    State<MoviePlayer> createState() => _MoviePlayerState();
}


class _MoviePlayerState extends State<MoviePlayer> 
{
  
    late final WebViewController controller;

    @override
    void initState()
    {
        super.initState();

        controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse("https://vsembed.ru/embed/movie/tt17048514/"))
            ..setNavigationDelegate
            (
                NavigationDelegate
                (
                    onNavigationRequest: (NavigationRequest request)
                    {
                        if(!request.url.startsWith("https://vsembed.ru/embed/movie"))
                        {
                            return NavigationDecision.prevent;
                        } else 
                        {
                            return NavigationDecision.navigate;
                        }
                    }
                )
            );

    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (
            appBar: AppBar
            (
                title: const Text('Test'),
            ),
            body: WebViewWidget(controller: controller),
        );
    }
}
