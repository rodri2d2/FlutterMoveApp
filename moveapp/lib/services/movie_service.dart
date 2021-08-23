import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moveapp/helpers/debouncer.dart';
import 'package:moveapp/models/cast.dart';
import 'package:moveapp/models/credit.dart';
import 'package:moveapp/models/most_popular.dart';
import 'package:moveapp/models/movie.dart';
import 'package:moveapp/models/on_cinemas.dart';


class MovieService extends ChangeNotifier{


  //Api properties
  String _baseURL   = 'api.themoviedb.org';
  String _apiKey    =  'ENTER YOUR OWN API KEY https://www.themoviedb.org/documentation/api';
  String _language  = 'en-US';

  //
  List<Movie> onCinemaMovies = [];
  List<Movie> mostPopular    = [];
  Map<int, List<Cast>> moviesCast = {};

  //
  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get  suggestionStream => this._suggestionStreamController.stream;

  //
  final debouncer = Debouncer(duration: Duration(microseconds: 500));

  //
  int _currentPage = 0;

  //
  MovieService(){
    this.fetchOnDisplayMovies();
    this.fetchMostPopularMovies();
  }


  _fetchData(String path, [ int page = 1]) async{
    var url = Uri.https(
        _baseURL,
        path,
        {
          'api_key' : _apiKey,
          'language': _language,
          'page'    : page.toString()
        }
    );
    final response = await http.get(url);
    return response.body;
  }

  /// To get a list of all movies on Cinema
  fetchOnDisplayMovies() async {
    //
    final response = await _fetchData('/3/movie/now_playing');
    final onCinema = OnCinema.fromJson(response);
    //
    this.onCinemaMovies = onCinema.results;
    //
    notifyListeners();
  }




  /// To get a list of all movies on Cinema
  fetchMostPopularMovies() async {

    this._currentPage++;

    final response = await _fetchData('/3/movie/popular', _currentPage);
    final popularMovies = MostPopular.fromJson(response);

    //
    this.mostPopular = [...mostPopular,  ...popularMovies.results];

    //
    notifyListeners();
  }


  /// To get a Cast information of a movie base on Movie ID
  Future<List<Cast>> fetchMovieCast(int movieId) async {
    if (this.moviesCast.containsKey(movieId)){
      return this.moviesCast[movieId]!;
    }else{
      final jsonData = await this._fetchData('3/movie/${movieId}/credits');
      final creditsRespponse = Credit.fromJson(jsonData);
      moviesCast[movieId] = creditsRespponse.cast;
      return creditsRespponse.cast;
    }
  }


  Future<List<Movie>> fetchSearchMovie( String query ) async {
    var url = Uri.https(
        _baseURL,
        '3/search/movie/',
        {
          'api_key' : _apiKey,
          'language': _language,
          'query'   : query
        }
    );

    final response = await http.get(url);
    final movieSearch =  MostPopular.fromJson(response.body);
    return movieSearch.results;
  }

  void getSuggestionByQuery(String query){
      debouncer.value = '';
      debouncer.onValue = (value) async {

        final results = await this.fetchSearchMovie(query);
        this._suggestionStreamController.add( results );

      };

      final timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
        debouncer.value = query;
      });

      Future.delayed(Duration(milliseconds: 2000))
      .then((value) => timer.cancel());
  }

}