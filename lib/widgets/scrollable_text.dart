import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:kiteapp/common/common.dart';

class ScrollableText extends StatefulWidget {
    final String text;

    const ScrollableText({super.key, required this.text,});

    @override
    State<ScrollableText> createState() => _ScrollableTextState();
}

class _ScrollableTextState extends State<ScrollableText> {
    bool focused = false;

    static const textStyle = TextStyle(
        color: kiteText,
        fontSize: 15,
        fontWeight: FontWeight.bold,
    );

    @override
    Widget build(BuildContext context) {
        return MouseRegion(
            onEnter: (_) => setState(() => focused = true),
            onExit: (_) => setState(() => focused = false),
            child: GestureDetector(
                onLongPressStart: (_) => setState(() => focused = true),
                onLongPressEnd: (_) => setState(() => focused = false),
                child: LayoutBuilder(
                builder: (context, constraints) {
                    final painter = TextPainter(
                        text: TextSpan(
                            text: widget.text,
                            style: textStyle,
                        ),
                        maxLines: 1,
                        textDirection: Directionality.of(context),
                        textScaler: MediaQuery.textScalerOf(context),
                    )..layout(maxWidth: constraints.maxWidth);

                final bool overflows = painter.didExceedMaxLines;

                return SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: focused && overflows
                    ? Marquee(
                        text: widget.text,
                        style: textStyle,
                        velocity: 30,
                        blankSpace: 40,
                        pauseAfterRound: const Duration(seconds: 2),
                    )
                    : Text(
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                    ),
                );
                },
                ),
            ),
        );
    }
}
