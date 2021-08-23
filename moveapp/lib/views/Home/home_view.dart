import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moveapp/helpers/search_delegate.dart';
import 'package:moveapp/services/movie_service.dart';
import 'package:moveapp/widgets/widgets.dart';


class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //
    final movieProvider = Provider.of<MovieService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'TMDB App',
          style: TextStyle(
              fontSize: 32,
              color: Colors.amberAccent
          ),
        ),
        actions: [
          IconButton(
              icon: Icon( Icons.search_outlined ),
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
        elevation: 3,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            //Main Cards
            CardSwiper(
              movies: movieProvider.onCinemaMovies,
            ),

            //Movie slider
            MovieSlider(
                popular: movieProvider.mostPopular,
              onNextPage: () => movieProvider.fetchMostPopularMovies(),
            ),

          ],
        ),
      )

    );
  }
}
