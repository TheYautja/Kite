import "package:flutter/material.dart";
import "package:kiteapp/widgets/bottom_nav.dart";


class UserProfile extends StatelessWidget {

    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("Kite")),
            body: Text("fuckass"),
            bottomNavigationBar: BottomNav(),
        );
    }

}
