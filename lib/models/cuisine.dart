// import 'package:json_annotation/json_annotation.dart';

// part 'cuisine.g.dart';

// @JsonSerializable()
class Cuisine {
  int idCuisine;
  String label;
  String description;

  Cuisine({
    required this.idCuisine,
    required this.label,
    required this.description,
  });

  // factory Cuisine.fromJson(Map<String, dynamic> json) =>
  //     _$CuisineFromJson(json);

  // Map<String, dynamic> toJson() => _$CuisineToJson(this);
}