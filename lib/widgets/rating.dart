import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";

class Rating extends StatelessWidget {

    double rating;
    String colorParam;

    Rating({required this.rating, required this.colorParam});

    @override
    Widget build(BuildContext context) {
        
        final String rStr = rating.toStringAsFixed(1);
        
        final color = (colorParam == "black") ? kiteBackground : kiteText;

        return Row(
            mainAxisSize: MainAxisSize.min,     
            children: [
                Icon(Icons.star, color: kiteAmber),
                Text(rStr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color )),
            ],
        );
    }
}
