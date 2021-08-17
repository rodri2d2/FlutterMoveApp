import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moveapp/models/most_popular.dart';
import 'package:moveapp/models/movie.dart';
import 'package:moveapp/models/on_cinemas.dart';
import 'package:moveapp/models/result_movie.dart';


class MovieService extends ChangeNotifier{


  //Api properties
  String _baseURL   = 'api.themoviedb.org';
  String _apiKey    =  'ENTER YOUR OWN API KEY https://www.themoviedb.org/documentation/api';
  String _language  = 'en-US';

  //
  List<Movie> onCinemaMovies = [];
  List<PopularResult> mostPopular    = [];

  //
  MovieService(){
    this.fetchOnDisplayMovies();
    this.fetchMostPopularMovies();
  }

  /// To get a list of all movies on Cinema
  fetchOnDisplayMovies() async {

    var url = Uri.https(
      _baseURL,
      '/3/movie/now_playing',
      {
        'api_key' : _apiKey,
        'language': _language,
        'page'    : '1'
      }
    );
    final response = await http.get(url);
    final onCinema = OnCinema.fromJson(response.body);

    //
    this.onCinemaMovies = onCinema.results;

    notifyListeners();
  }

  /// To get a list of all movies on Cinema
  fetchMostPopularMovies() async {

    var url = Uri.https(
        _baseURL,
        '/3/movie/popular',
        {
          'api_key' : _apiKey,
          'language': _language,
          'page'    : '1'
        }
    );
    final response = await http.get(url);
    final popularMovies = MostPopular.fromJson(response.body);

    //
    this.mostPopular = popularMovies.results;

    //
    notifyListeners();
  }

}