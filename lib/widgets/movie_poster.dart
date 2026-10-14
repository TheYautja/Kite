
import 'package:flutter/material.dart';
import 'package:kiteapp/common/common.dart';

class MoviePoster extends StatelessWidget {
    final String path;

    const MoviePoster({
        super.key,
        required this.path,
    });

    @override
    Widget build(BuildContext context) {
        if (path.trim().isEmpty) {
            return const Center(
                child: Icon(
                    Icons.movie_outlined,
                    size: 40,
                    color: kiteTextSecondary,
                ),
            );
        }

        return Image.network(
            path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            cacheWidth: 342,
            filterQuality: FilterQuality.low,
            loadingBuilder: (context, child, progress) {
                if (progress == null) return child;

                return const Center(
                    child: CircularProgressIndicator(
                        color: kitePrimary,
                    ),
                );
            },
            errorBuilder: (context, error, stackTrace) {
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

