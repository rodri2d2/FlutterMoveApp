import 'package:flutter/material.dart';
import 'package:moveapp/widgets/widgets.dart';


class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theater movies'),
        actions: [
          IconButton(
              icon: Icon( Icons.search_outlined ),
              onPressed: (){},
          )
        ],
        elevation: 0,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            //Main Cards
            CardSwiper(),

            //Movie slider
            MovieSlider(),

          ],
        ),
      )

    );
  }
}
