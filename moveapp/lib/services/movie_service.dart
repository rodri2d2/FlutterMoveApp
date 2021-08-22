import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

}