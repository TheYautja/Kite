import "package:flutter/material.dart";
import "package:kiteapp/widgets/bottom_nav.dart";

class Config extends StatelessWidget {
    
    @override
    Widget build(BuildContext context){
        
        return Scaffold(
            appBar: AppBar(title: Text("Kite")),
            body: Text("config"),
            bottomNavigationBar: BottomNav(),
        ); 
    }

}
