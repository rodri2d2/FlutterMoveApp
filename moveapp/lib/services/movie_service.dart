import 'package:flutter/material.dart';

class MovieService extends ChangeNotifier{

  //
  MovieService(){
    print('PROVIDER INITIALIZED');
  }

  /// To get a list of all movies on Cinema
  fetchOnDisplayMovies() async {
    print('FETCHING CINEMA MOVIES');
  }
}