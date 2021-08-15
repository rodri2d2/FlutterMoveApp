import 'package:flutter/material.dart';


class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

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
              child:         ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, int index) => _MovieListContainer(),

              ),
          )

        ],
      ),
    );
  }
}


class _MovieListContainer extends StatelessWidget {
  const _MovieListContainer({Key? key}) : super(key: key);

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
                image: NetworkImage('https://via.placeholder.com/300x400'),
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
              'Back to the future',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )


        ],
      ),
    );
  }
}
