

// To parse this JSON data, do
//
//     final credit = creditFromMap(jsonString);

import 'dart:convert';

import 'cast.dart';

class Credit {

  int id;
  List<Cast> cast;
  List<Cast> crew;


  Credit({
    required this.id,
    required this.cast,
    required this.crew,
  });


  factory Credit.fromJson(String str) => Credit.fromMap(json.decode(str));

  factory Credit.fromMap(Map<String, dynamic> json) => Credit(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );

}

