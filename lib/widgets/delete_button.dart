import "package:flutter/material.dart";
import "package:kiteapp/api/db_helper.dart";
import "package:kiteapp/common/common.dart";

class DeleteButton extends StatelessWidget {

    final int movieId;
    final DbHelper db = DbHelper();

    DeleteButton({super.key, required this.movieId});

    @override 
    Widget build(BuildContext context){
        return IconButton(
            onPressed: () {
                db.deleteMovieById([movieId] ,"user_movies");
            }, 
            icon: const Icon(Icons.delete),
            color: kiteError ,
            tooltip: "Remove",
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
        );
    }

}

