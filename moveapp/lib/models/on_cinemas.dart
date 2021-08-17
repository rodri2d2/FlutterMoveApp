import 'dart:convert';
import 'dates.dart';
import 'movie.dart';

class OnCinema {

  //Properties
  Dates        dates;
  int          page;
  List<Movie> results;
  int          totalPages;
  int          totalResults;

  //Constructor
  OnCinema({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  ///Construct from JSON
  factory OnCinema.fromJson(String str) => OnCinema.fromMap(json.decode(str));

  ///Construct from MAP
  factory OnCinema.fromMap(Map<String, dynamic> json) => OnCinema(
    dates:        Dates.fromMap(json["dates"]),
    page:         json["page"],
    results:      List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages:   json["total_pages"],
    totalResults: json["total_results"],
  );


}




