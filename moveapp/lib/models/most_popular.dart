
import 'dart:convert';
import 'package:moveapp/models/movie.dart';


class MostPopular {

  //Properties
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MostPopular({
   required this.page,
   required this.results,
   required this.totalPages,
   required this.totalResults,
  });


  ///Constructor from JSON
  factory MostPopular.fromJson(String str) => MostPopular.fromMap(json.decode(str));

  ///Constructor from MAP
  factory MostPopular.fromMap(Map<String, dynamic> json) => MostPopular(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}


