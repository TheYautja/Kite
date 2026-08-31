import "package:flutter/material.dart";
import "package:kiteapp/common/common.dart";


class MoviePoster extends StatelessWidget{
    
    String path;

    MoviePoster({required this.path});

    @override 
    Widget build(BuildContext context){
        
        return path.isEmpty ? const Center(
            child: Icon(
                Icons.movie_outlined,
                size: 40,
                color: kiteTextSecondary,
            ),
        ) : Image.network(
            path,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (
                context,
                child,
                loadingProgress,
            ) {
                if (loadingProgress == null) {
                    return child;
                }
                return const Center(
                    child: CircularProgressIndicator(),
                );
            },
            errorBuilder: (
                context,
                error,
                stackTrace,
            ) {
                return const Center(
                    child: Icon(
                        Icons.broken_image_outlined,
                        size: 40,
                        color: kiteTextSecondary,
                    ),
                );
            },
        );
    }

}
