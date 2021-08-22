import 'package:flutter/material.dart';
import 'package:moveapp/models/movie.dart';



class MovieSlider extends StatefulWidget {

  //
  final List<Movie> popular;
  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.popular,
    required this.onNextPage
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
        if( scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
            widget.onNextPage();
        }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


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
                controller: this.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.popular.length,
                itemBuilder: (_, int index) {
                 return _MovieListContainer(movie: widget.popular[index]);
                },

              ),
          )

        ],
      ),
    );
  }
}


class _MovieListContainer extends StatelessWidget {

  final Movie movie;

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
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: movie),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:FadeInImage(
                placeholder: AssetImage('resources/assets/loading.gif'),
                image: NetworkImage(movie.fullPosterURL),
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
