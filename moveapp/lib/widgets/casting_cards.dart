import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.only(bottom: 32),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, int index) => _CastingItem()
      ),
    );
  }
}


class _CastingItem extends StatelessWidget {


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
              image: NetworkImage('https://via.placeholder.com/150X200'),
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8),

          //Actor Name
          Text(
              'Michel J. Fox',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

          
        ],
      ),

    );
  }
}
