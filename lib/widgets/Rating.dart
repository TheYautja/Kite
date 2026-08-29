import "package:flutter/material.dart";
import "package:kiteapp/common/Common.dart";

class Rating extends StatelessWidget {
  double rating;

  Rating({required this.rating});

  @override
  Widget build(BuildContext context) {
    final String rStr = rating.toStringAsFixed(1);

    return Row(
      children: [
        Icon(Icons.star, color: kiteAmber),
        Text(rStr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
