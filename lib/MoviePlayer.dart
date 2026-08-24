import 'package:flutter/material.dart';
import 'package:kiteapp/BottomNav.dart';
import "package:kiteapp/Rating.dart";
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

        String tmdbId = widget.movie.id.toString();

        super.initState();

        controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse("https://vsembed.ru/embed/movie/${tmdbId}/"))
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
                title: const Text('Watch'),
            ),
            body: Column
            (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                    Expanded
                    (   
                        flex: 3,
                        child: WebViewWidget(controller: controller),
                    ),
                    Expanded
                    (
                        flex: 7,
                        child: Padding
                        (
                            padding: EdgeInsets.all(10),
                            child: Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                [
                                    Text(widget.movie.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                    Text(widget.movie.date.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Rating(rating: widget.movie.rating),
                                    Text(widget.movie.description),
                                    Spacer(),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
            bottomSheet: BottomNav(),
        );
    }
}
