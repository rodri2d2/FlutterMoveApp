import 'package:flutter/material.dart';
import 'package:moveapp/models/movie.dart';
import 'package:moveapp/widgets/casting_cards.dart';


class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    print('On detail ${ movie.title} ');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //
          _CustomAppBar(movie: movie),

          //
          SliverList(
              delegate: SliverChildListDelegate([
                //
                _PosterAndTitle(movie: movie),

                //
                _Overview(overview: movie.overview),

                //
                CastingCard(movieId: movie.id),
              ])
          )
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {


  final Movie movie;

  _CustomAppBar({
    Key? key,
    required this.movie
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueGrey,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
          color: Colors.black12,
          child: Text(
              movie.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('resources/assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPathURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  _PosterAndTitle({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [

          //
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage(
              placeholder: AssetImage('resources/assets/loading.gif'),
              image: NetworkImage(movie.fullPosterURL),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),


          //
          SizedBox(width: 20),

          //
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width - 200,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                //
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                Row(
                  children: [
                    Icon(Icons.star_outline, size: 15, color: Colors.blueGrey),

                    //
                    SizedBox(width: 5),

                    Text(
                      ' ${ movie.voteAverage }',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                )

              ],
            ),
          ),



        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final String overview;

  _Overview({ Key? key , required this.overview }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        this.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

