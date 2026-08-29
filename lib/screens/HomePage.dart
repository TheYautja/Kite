import "package:flutter/material.dart";
import "package:kiteapp/screens/TmdbSearch.dart";
import "package:kiteapp/api/API.dart";
import "package:kiteapp/widgets/BottomNav.dart";
import "package:kiteapp/model/Movie.dart";
import "package:kiteapp/widgets/MovieCard.dart";
import "package:kiteapp/widgets/CarouselList.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  API api = API();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kite"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => TmdbSearchPage())),
            icon: Icon(Icons.search),
          ),
        ],
      ),

      body: FutureBuilder(
        future: loadAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return Text("Empty snapshot");
          }

          final List<Movie> top = snapshot.data![0];
          final List<Movie> popular = snapshot.data![1];
          final List<Movie> upcoming = snapshot.data![2];

          return CarouselList(top: top, popular: popular, upcoming: upcoming, type: "debug");

          },
      ),

      bottomSheet: BottomNav(),
    );
  }


    Future<List<dynamic>> loadAllMovies() async {

        final results = await Future.wait([
            api.getMovies("popular"),
            api.getMovies("top_rated"),
            api.getMovies("upcoming"),
        ]);

        return results;
    }


}
