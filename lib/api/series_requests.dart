import "package:kiteapp/model/series.dart";
import "package:http/http.dart" as http;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "dart:convert";


class SeriesRequests {
    
    final String ACCESS_TOKEN = dotenv.get("ACCESS_TOKEN");
    final String baseUrl = "https://api.themoviedb.org/3/tv/"; 

    static final SeriesRequests _api = SeriesRequests._internal();

    //singleton
    factory SeriesRequests() {
        return _api;
    }

    SeriesRequests._internal();

    Future<List<Series>> getSeries(String requestType) async {
        String finalUrl = baseUrl + requestType;
        final response = await http.get(
            Uri.parse(finalUrl),
                headers: {
                'Authorization': 'Bearer ${ACCESS_TOKEN}',
                'Accept': 'application/json',
            },
        );

        if (response.statusCode == 200) {
            return SeriesResponse.fromJson(json.decode(response.body)).response;
        } else {
            throw Exception("${response.statusCode}");
        }
    }
    
    
    Future<Series> getDetails(int id) async {
        final response = await http.get(
            Uri.parse('$baseUrl$id'),
            headers: {
                'Authorization': 'Bearer $ACCESS_TOKEN',
                'Accept': 'application/json',
            },
        );

        if (response.statusCode != 200) {
            throw Exception(
                'Failed to fetch series details: ${response.statusCode}',
            );
        }

        return Series.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>,
        );
    }


    Future<List<Series>> searchByName(String name) async {
        String url = "https://api.themoviedb.org/3/search/tv?query=${parseInput(name)}";
        final response = await http.get(
            Uri.parse(url),
            headers: {
                'Authorization': 'Bearer ${ACCESS_TOKEN}',
                'Accept': 'application/json',
            },
        );

        if(response.statusCode == 200){
            return SeriesResponse.fromJson(json.decode(response.body)).response;
        } else {
            throw Exception("${response.statusCode}");
        }

    }


    String parseInput(String input){
        return input.trim().replaceAll(" ", "+");
    }



}
