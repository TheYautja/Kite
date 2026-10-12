import "package:flutter/material.dart";

class ConfigOption extends StatelessWidget {

    final String title;
    final Function onClick;
    final String args;

    ConfigOption({required this.title, required this.onClick, required this.args});

    void exec(){
        onClick(args);
    }

    @override 
    Widget build(BuildContext contex){
        return Column(
            children: [
                ElevatedButton(
                    onPressed: (){exec;},
                    child: Text(title),
                ),
                SizedBox(height: 10),
            ],
        );
    }

}
