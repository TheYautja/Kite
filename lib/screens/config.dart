import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";
import "package:kiteapp/widgets/bottom_nav.dart";
import "package:kiteapp/widgets/config_option.dart";

class Config extends StatelessWidget {
    
    void test(){
        print("clciked");
    }

    @override
    Widget build(BuildContext context){
        
        return Scaffold(
            appBar: AppBar(title: Text("Kite")),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(width: double.infinity),
                    Text("Settings"),
                    Expanded(
                        child: Card(
                            color: kiteTextSecondary,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Text("Appearance"),
                                    Spacer(),
                                    ConfigOption(title: "Colorscheme", onClick: test,),
                                    ConfigOption(title: "Colorscheme", onClick: test,),
                                    ConfigOption(title: "Colorscheme", onClick: test,),
                                    Spacer(),
                                ],
                            ),
                        ),
                    ),
                    Expanded(
                        child: Card(
                            color: kiteTextSecondary,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Text("Lists"),
                                    ConfigOption(title: "Export list to file", onClick: test,),
                                    ConfigOption(title: "Import list from file", onClick: test,),
                                    ConfigOption(title: "Change movie data provider", onClick: test,),
                                    Spacer(),
                                ],
                            ),
                        ),
                    ),
                    Spacer(),
                ],
            ),
            bottomNavigationBar: BottomNav(),
        ); 
    }

}
