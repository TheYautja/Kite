import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "dart:io";
import "Movie.dart";


class MoviePlayer extends StatefulWidget 
{   

    final Movie movie;

    const MoviePlayer({super.key, required this.movie});
    
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
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        
        return Scaffold
        (
            appBar: AppBar
            (
                title: const Text('Test'),
            ),
            body: SizedBox
            (
                width: width,
                height: height/3,
                child: WebViewWidget(controller: controller),
            )
        );
    }
}
