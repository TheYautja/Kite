import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class BottomNav extends StatelessWidget
{
    @override
      Widget build(BuildContext context){
        return Container(
            color: Colors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    IconButton(icon: Icon(Icons.home), onPressed: () {},),
                    IconButton(icon: Icon(Icons.list), onPressed: () {},),
                    IconButton(icon: Icon(Icons.person), onPressed: () {},),
                ] 
            ),);
      }
}
