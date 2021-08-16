import 'package:flutter/material.dart';


class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //
          _CustomAppBar(),

          //
          SliverList(
              delegate: SliverChildListDelegate([
                _PosterAndTitle(),
                _Overview()
              ])
          )

        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {

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
          color: Colors.black12,
          child: Text(
              'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('resources/assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/300x400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

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
              image: NetworkImage('https://via.placeholder.com/150X200'),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),


          //
          SizedBox(width: 20),

          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                  'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),

              //
              Text(
                'movie.originalTitle',
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
                      'movie-rate',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'),
    );
  }
}

