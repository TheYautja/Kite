
class Series {
    final int id;
    final String name;
    final String imgUrl;
    final String date;
    final double rating;
    final String description;
    final List<Season> seasons;
    final String creator;

    const Series({
        required this.id,
        required this.name,
        required this.imgUrl,
        required this.date,
        required this.rating,
        required this.description,
        this.seasons = const [],
        this.creator = 'Unknown creator',
    });

    factory Series.fromJson(Map<String, dynamic> json) {
        final creators = json['created_by'] as List<dynamic>?;
        final seasonData = json['seasons'] as List<dynamic>?;

        return Series(
            id: (json['id'] as num?)?.toInt() ?? 0,
            name: json['name'] as String? ?? 'Unknown',
            imgUrl: json['poster_path'] != null
                ? 'https://image.tmdb.org/t/p/w342${json['poster_path']}'
                : '',
            date: json['first_air_date'] as String? ?? 'Unknown',
            rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
            description: json['overview'] as String? ?? 'No overview available',
            creator: creators != null && creators.isNotEmpty
                ? (creators.first['name'] as String? ?? 'Unknown creator')
                : 'Unknown creator',
            seasons: seasonData == null
                ? []
                : seasonData.map((item) {
                    return Season.fromJson(item as Map<String, dynamic>);
                }).toList(),
        );
    }

    
    factory Series.fromDbResponse(Map<String, dynamic> json) {
        return Series(
            id: (json['id'] as num?)?.toInt() ?? 0,
            name: json['name'] as String? ?? 'Unknown',
            imgUrl: json['imgUrl'] as String? ?? '',
            date: json['date'] as String? ?? 'Unknown',
            rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
            description: json['description'] as String? ?? '',
            creator: json['creator'] as String? ?? 'Unknown creator',
            seasons: (json['seasons'] as List<dynamic>? ?? []).map((item) {
                return Season.fromJson(item as Map<String, dynamic>);
            }).toList(),
        );
    }


    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'name': name,
            'imgUrl': imgUrl,
            'date': date,
            'rating': rating,
            'description': description,
            'creator': creator,
            'seasons': seasons.map((season) => season.toJson()).toList(),
        };
    }
}

class Season {
    final int id;
    final String name;
    final String airDate;
    final int episodeCount;
    final String overview;
    final String posterPath;
    final int seasonNumber;
    final double rating;

    const Season({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episodeCount,
        required this.overview,
        required this.posterPath,
        required this.seasonNumber,
        required this.rating,
    });

    factory Season.fromJson(Map<String, dynamic> json) {
        return Season(
            id: (json['id'] as num?)?.toInt() ?? 0,
            name: json['name'] as String? ?? 'Unknown',
            airDate: json['air_date'] as String? ?? 'Unknown',
            episodeCount: (json['episode_count'] as num?)?.toInt() ?? 0,
            overview: json['overview'] as String? ?? '',
            posterPath: json['poster_path'] != null
                ? 'https://image.tmdb.org/t/p/w342${json['poster_path']}'
                : '',
            seasonNumber: (json['season_number'] as num?)?.toInt() ?? 0,
            rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'name': name,
            'air_date': airDate,
            'episode_count': episodeCount,
            'overview': overview,
            'poster_path': posterPath,
            'season_number': seasonNumber,
            'vote_average': rating,
        };
    }
}

class SeriesResponse {
    final List<Series> response;

    const SeriesResponse({required this.response});

    factory SeriesResponse.fromJson(Map<String, dynamic> json) {
        final results = json['results'] as List<dynamic>? ?? [];

        return SeriesResponse(
            response: results.map((item) {
                return Series.fromJson(item as Map<String, dynamic>);
            }).toList(),
        );
    }
}

