import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";
import "package:kiteapp/widgets/bottom_nav.dart";

class Config extends StatelessWidget {
    
    @override
    Widget build(BuildContext context){
        
        return Scaffold(
            appBar: AppBar(title: Text("Kite")),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(width: double.infinity),
                    Text("Settings"),
                    Card(
                        color: kitePrimaryLight,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text("Appearance"),
                                ElevatedButton(onPressed: (){}, child: Text("a")),
                                ElevatedButton(onPressed: (){}, child: Text("b")),
                                ElevatedButton(onPressed: (){}, child: Text("c")),
                            ],
                        ),
                    ),
                    Card(
                        color: kiteSurfaceLight,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text("Lists"),
                                ElevatedButton(onPressed: (){}, child: Text("Export list to file")),
                                ElevatedButton(onPressed: (){}, child: Text("Import list from file")),
                            ],
                        ),
                    ),
                ],
            ),
            bottomNavigationBar: BottomNav(),
        ); 
    }

}
