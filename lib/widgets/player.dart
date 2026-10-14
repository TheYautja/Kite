
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Player extends StatefulWidget {
    final int id;
    final bool isSeries;
    final int season;
    final int episode;

    const Player({
        super.key,
        required this.id,
        this.isSeries = false,
        this.season = 1,
        this.episode = 1,
    });

    @override
    State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
    late final WebViewController controller;

    String get url {
        if (widget.isSeries) {
            return 'https://vidsrc.to/embed/tv/${widget.id}/${widget.season}/${widget.episode}';
        }

        return 'https://vsembed.ru/embed/movie/${widget.id}/';
    }

    @override
    void initState() {
        super.initState();

        controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(
                NavigationDelegate(
                    onNavigationRequest: (request) {
                        final uri = Uri.tryParse(request.url);

                        if (uri == null || uri.scheme != 'https') {
                            return NavigationDecision.prevent;
                        }

                        if (uri.host == 'vidsrc.to' ||
                            uri.host == 'vsembed.ru') {
                            return NavigationDecision.navigate;
                        }

                        return NavigationDecision.prevent;
                    },
                ),
            );

        controller.loadRequest(Uri.parse(url));
    }

    @override
    void didUpdateWidget(covariant Player oldWidget) {
        super.didUpdateWidget(oldWidget);

        if (oldWidget.id != widget.id ||
            oldWidget.isSeries != widget.isSeries ||
            oldWidget.season != widget.season ||
            oldWidget.episode != widget.episode) {
            controller.loadRequest(Uri.parse(url));
        }
    }

    @override
    Widget build(BuildContext context) {
        return WebViewWidget(controller: controller);
    }
}

