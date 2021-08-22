import 'package:flutter/material.dart';
import 'package:moveapp/models/movie.dart';
import 'package:moveapp/services/movie_service.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [

      //Clear Button
      IconButton(
        icon: Icon( Icons.clear ) ,
        onPressed: () {

         query.isEmpty
         ?close(context, null)
         :query = '';
        },
      )


    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        } ,
      );

  }

  @override
  Widget buildResults(BuildContext context) {

    if ( query.isEmpty ){
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MovieService>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.fetchSearchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot){

        if( !snapshot.hasData ){
          return _emptyContainer();
        }

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_ , int index) => MovieSugestionItem(movie: movies[index]),
        );
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if ( query.isEmpty ){
        return _emptyContainer();
    }

    final moviesProvider = Provider.of<MovieService>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.fetchSearchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot){

        if( !snapshot.hasData ){
          return _emptyContainer();
        }

        final movies = snapshot.data!;

        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_ , int index) => MovieSugestionItem(movie: movies[index]),
        );
      },
    );
  }

  Widget _emptyContainer(){
    return Container(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          size: 180,
          color: Colors.black26,
        ),
      ),
    );
  }


}


class MovieSugestionItem extends StatelessWidget {

  final Movie movie;

  const MovieSugestionItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ListTile(
        leading: FadeInImage(
          placeholder: AssetImage('resources/assets/loading.gif') ,
          image: NetworkImage(movie.fullPosterURL),
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(movie.originalTitle),
        subtitle: Text(movie.popularity.toString()),
        onTap: () {
          Navigator.pushNamed(context, 'detail', arguments: movie);
        },
      ),
    );
  }
}


