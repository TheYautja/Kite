import "package:flutter/material.dart";
import "package:kiteapp/screens/TmdbSearch.dart";
import "package:kiteapp/api/API.dart";
import "package:kiteapp/widgets/BottomNav.dart";
import "package:kiteapp/model/Movie.dart";
import "package:kiteapp/widgets/MovieCard.dart";

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
        future: api.getMovies("top_rated"),
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
          List<Movie> movieList = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: movieList[index]);
            },
          );
        },
      ),

      bottomSheet: BottomNav(),
    );
  }
}
