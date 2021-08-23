import 'package:flutter/material.dart';
import 'package:moveapp/services/movie_service.dart';
import 'package:provider/provider.dart';

//Routes
import './views/views.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ ) => MovieService(), lazy: false,)
        ],
      child: MyApp(),
    );
  }
}



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
          color: Colors.black
        )
      ),
    );
  }
}
