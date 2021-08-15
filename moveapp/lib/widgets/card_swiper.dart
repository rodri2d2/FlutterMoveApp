import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    //
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: deviceSize.height * 0.45, // to get 50% of screen size not includin app bar
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: deviceSize.width * 0.8,
        itemHeight: deviceSize.height * 0.6,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FadeInImage(
                placeholder: AssetImage('resources/assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
              ),
            ),
          );

        },
      ),
    );
  }
}
