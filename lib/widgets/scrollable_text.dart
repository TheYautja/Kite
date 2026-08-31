import "package:flutter/material.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:kiteapp/common/common.dart";
import "package:marquee/marquee.dart";

class ScrollableText extends StatelessWidget{
 
    String text;

    ScrollableText({required this.text});

    @override
    Widget build(BuildContext context) {

        return AutoSizeText(
            text,
            maxLines: 1,
            style: TextStyle(color: kiteText, fontSize: 15, fontWeight: FontWeight.bold),
            minFontSize: 15,
            overflowReplacement: Marquee(
                text: text,
                style: const TextStyle(
                    color: kiteText,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 40.0,
                velocity: 30.0,
                pauseAfterRound: Duration(seconds: 2),
                startPadding: 0,
                accelerationDuration: Duration(milliseconds: 500),
                decelerationDuration: Duration(milliseconds: 500),
            ),
        );
    }

}
