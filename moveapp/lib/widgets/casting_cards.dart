import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moveapp/models/cast.dart';
import 'package:moveapp/services/movie_service.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {

  final int movieId;

  CastingCard({
    Key? key,
    required this.movieId
  }): super(key: key);


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieService>(context, listen: false);


    return FutureBuilder(
      future: moviesProvider.fetchMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

        if (!snapshot.hasData){
          return Container(
              height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data;

          return Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.only(bottom: 32),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cast!.length,
                itemBuilder: (_, int index) => _CastingItem(actor: cast[index])
            ),
          );

      },
    );
  }
}

class _CastingItem extends StatelessWidget {

  Cast actor;

  _CastingItem({
    Key? key,
    required this.actor
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          
          //
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage(
              placeholder: AssetImage('resources/assets/loading.gif'),
              image: NetworkImage(actor.fullProfilePath),
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 4),

          //Actor Name
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),

    );
  }
}
