import "package:flutter/material.dart";
import "package:kiteapp/Common.dart";


class Rating extends StatelessWidget
{
    double rating;

    Rating
    ({
        required this.rating,
    });

    @override
    Widget build(BuildContext context) 
    {
        return Row
        (
            children:
            [
                Icon(Icons.star, color: kiteAmber,),
                Text(rating.toString().substring(2), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
        );
    }

}
