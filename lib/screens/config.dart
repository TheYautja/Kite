import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";
import "package:kiteapp/widgets/bottom_nav.dart";
import "package:kiteapp/widgets/config_option.dart";
import "package:kiteapp/api/config_utilities.dart";

class Config extends StatelessWidget {
    
    ConfigUtils utils = ConfigUtils();

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
                                    ConfigOption(title: "Export list to file", onClick: utils.exportToFile, args: "test"),
                                    ConfigOption(title: "Import list from file", onClick: utils.exportToFile, args: "test"),
                                    ConfigOption(title: "Change movie data provider", onClick: utils.exportToFile, args: "test"),
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
