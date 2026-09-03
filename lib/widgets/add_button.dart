import "package:flutter/material.dart";
import "package:kiteapp/api/db_helper.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/common/common.dart";

class AddButton extends StatelessWidget {
    
    DbHelper dbHelper = DbHelper();
    late Movie movie;

    AddButton({required this.movie}); 

    @override 
    Widget build(BuildContext context){
        return IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
               dbHelper.insertMovie(movie); 
            },
            color: kiteAmber,
            padding: EdgeInsets.zero,
            tooltip: "add to list",
            constraints: const BoxConstraints(),
        );
    }

}
