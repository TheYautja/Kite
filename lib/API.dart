import "Movie.dart";
import "package:http/http.dart" as http;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "dart:convert";

class API {
    final String ACCESS_TOKEN = dotenv.get("ACCESS_TOKEN");
    final String baseUrl = "https://api.themoviedb.org/3/movie/";

    static final API _api = API._internal();

    //singleton
    factory API() {
        return _api;
    }

    API._internal();

    Future<List<Movie>> getMovies(String requestType) async {
        String finalUrl = baseUrl + requestType;
        final response = await http.get(
            Uri.parse(finalUrl),
                headers: {
                'Authorization': 'Bearer ${ACCESS_TOKEN}',
                'Accept': 'application/json',
            },
        );

        if (response.statusCode == 200) {
            return MovieResponse.fromJson(json.decode(response.body)).response;
        } else {
            throw Exception("${response.statusCode}");
        }
    }


    Future<List<Movie>> searchByName(String name) async {
        String url = "https://api.themoviedb.org/3/search/movie?query=${name}";
        final response = await http.get(
            Uri.parse(url),
            headers: {
                'Authorization': 'Bearer ${ACCESS_TOKEN}',
                'Accept': 'application/json',
            },
        );

        if(response.statusCode == 200){
            return MovieResponse.fromJson(json.decode(response.body)).response;
        } else {
            throw Exception("${response.statusCode}");
        }

    }

}
