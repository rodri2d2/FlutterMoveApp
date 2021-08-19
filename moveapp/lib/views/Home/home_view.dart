import 'package:flutter/material.dart';
import 'package:moveapp/services/movie_service.dart';
import 'package:moveapp/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //
    final movieProvider = Provider.of<MovieService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theater movies'),
        actions: [
          IconButton(
              icon: Icon( Icons.search_outlined ),
              onPressed: (){},
          )
        ],
        elevation: 0,
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
