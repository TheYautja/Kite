
class SeriesResponse {

    List<Series> response;

    SeriesResponse({
        required this.response,
    });

    factory SeriesResponse.fromJson(Map<String, dynamic> json){
        return SeriesResponse(
            response: List<Series>.from(
                (json['results'] ?? []).map((x) => Series.fromJson(x)),
            ), 
        );
    }

}

class Series {
    
    int id;
    String name;
    List<Season> seasons;
    String creator;
    String first_air_date;

    Series({
        required this.id,
        required this.name,
        required this.seasons,
        required this.creator,
        required this.first_air_date,
    });


    factory Series.fromJson(Map<String, dynamic> json){
        
        return Series(
            id: json['id'],
            name: json['name'],
            seasons: json['seasons'] ?? [],
            creator: json['created_by']['name'] ?? "Unknown creator",
            first_air_date: json['first_air_date'] ?? "Unknown air date",
        );

    }

}


class Season {

    String air_date;
    int episode_count;
    int id;
    String name;
    String overview;
    String poster_path;
    int season_number;
    int vote_average;


    Season({
        required this.air_date,
        required this.episode_count,
        required this.id,
        required this.name,
        required this.overview,
        required this.poster_path,
        required this.season_number,
        required this.vote_average,
    });


    factory Season.fromJson(Map<String, dynamic> json){
        
        return Season(
            air_date: json['air_date'] ?? "Unknown air date",
            episode_count: json['episode_count'] ?? 0,
            id: json['id'],
            name: json['name'],
            overview: json['overview'] ?? "No overview avaliable",
            poster_path: json['poster_path'] ?? " ",
            season_number: json['season_number'] ?? 0,
            vote_average: json['vote_average'] ?? 0,
        );

    }

}

