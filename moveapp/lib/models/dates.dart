import 'dart:convert';

class Dates {

  //Properties
  DateTime maximum;
  DateTime minimum;

  //Constructor
  Dates({
    required this.maximum,
    required this.minimum,
  });

  ///Constructor from JSON
  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  ///Constructor from MAP
  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );


}