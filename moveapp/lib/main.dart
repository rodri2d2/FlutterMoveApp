import 'package:flutter/material.dart';

//Routes
import './views/views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: 'home',
      routes: {
        'home'  : ( _ ) => HomeView(),
        'detail': ( _ ) => DetailView()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey
        )
      ),
    );
  }
}
