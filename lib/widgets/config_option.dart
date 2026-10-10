import "package:flutter/material.dart";

class ConfigOption extends StatelessWidget {

    final String title;
    final Function onClick;

    ConfigOption({required this.title, required this.onClick});

    @override 
    Widget build(BuildContext contex){
        return Column(
            children: [
                ElevatedButton(
                    onPressed: (){onClick;},
                    child: Text(title),
                ),
                SizedBox(height: 10),
            ],
        );
    }

}
