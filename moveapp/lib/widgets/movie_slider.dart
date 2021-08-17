import 'package:flutter/material.dart';
import 'package:moveapp/models/movie.dart';
import 'package:moveapp/models/result_movie.dart';


class MovieSlider extends StatelessWidget {

  //
  final List<PopularResult> popular;

  const MovieSlider({
    Key? key,
    required this.popular
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              'Top movies',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popular.length,
                itemBuilder: (_, int index) {
                 return _MovieListContainer(movie: popular[index]);
                },

              ),
          )

        ],
      ),
    );
  }
}


class _MovieListContainer extends StatelessWidget {

  final PopularResult movie;

  const _MovieListContainer({
    Key? key,
    required this.movie

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          //
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: 'movie-instance'),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:FadeInImage(
                placeholder: AssetImage('resources/assets/loading.gif'),
                image: NetworkImage(movie.fullPosterPath),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //
          SizedBox(height: 5),

          //
          Text(
              movie.originalTitle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )


        ],
      ),
    );
  }
}
