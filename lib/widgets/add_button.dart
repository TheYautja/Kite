import "package:flutter/material.dart";
import "package:kiteapp/api/db_helper.dart";
import "package:kiteapp/model/movie.dart";
import "package:kiteapp/common/common.dart";

class AddButton extends StatelessWidget {
    
    DbHelper dbHelper = DbHelper();
    late Movie movie;

    AddButton({required this.movie}); 

    SnackBar snackBar = SnackBar(content: Text("added to the library"));

    @override 
    Widget build(BuildContext context){
        return IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
               dbHelper.insertMovie(movie, "user_movies");
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            color: kiteAmber,
            tooltip: "add to list",
            constraints: const BoxConstraints(),
        );
    }

}
