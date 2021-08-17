// To parse this JSON data, do
//
//     final mostPopular = mostPopularFromMap(jsonString);

import 'dart:convert';

import 'package:moveapp/models/result_movie.dart';

class MostPopular {

  //Properties
  int page;
  List<PopularResult> results;
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
    results: List<PopularResult>.from(json["results"].map((x) => PopularResult.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}


