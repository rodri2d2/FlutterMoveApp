import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:moveapp/models/movie.dart';

class CardSwiper extends StatelessWidget {

  List<Movie> movies;

  //Constructor
  CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);





  @override
  Widget build(BuildContext context) {

    //
    final deviceSize = MediaQuery.of(context).size;

    if (movies.length == 0){
      return Container(
        width: double.infinity,
        height: deviceSize.height * 0.45,
        child: Center(
          child: CircularProgressIndicator(),
        ),

      );
    }


    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: deviceSize.height * 0.45, // to get 50% of screen size not includin app bar
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: deviceSize.width * 0.8,
        itemHeight: deviceSize.height * 0.6,
        itemBuilder: (BuildContext context, int index){

          final movie = movies[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FadeInImage(
                placeholder: AssetImage('resources/assets/loading.gif'),
                image: NetworkImage(movie.fullPosterURL),
                fit: BoxFit.cover,
              ),
            ),
          );

        },
      ),
    );
  }
}
