// import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

// part 'restaurants.g.dart';

// @JsonSerializable()
class Restaurants {
  int idRestaurant;
  String name;
  int priceRange;
  Address address;
  String mainImage;
  String description;
  String openingHours; // Consider using a specific format for opening hours
  String phoneNumber;
  String whatsapp;

  Restaurants({
    required this.idRestaurant,
    required this.name,
    required this.priceRange,
    required this.address,
    required this.mainImage,
    required this.description,
    required this.openingHours,
    required this.phoneNumber,
    required this.whatsapp,
  });

  // factory Restaurants.fromJson(Map<String, dynamic> json) =>
  //     _$RestaurantsFromJson(json);

  // Map<String, dynamic> toJson() => _$RestaurantsToJson(this);
}