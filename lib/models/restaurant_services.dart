// import 'package:json_annotation/json_annotation.dart';

// part 'restaurant_services.g.dart';

// @JsonSerializable()
class RestaurantServices {
  int idRestaurant;
  int idService;

  RestaurantServices({
    required this.idRestaurant,
    required this.idService,
  });

  // factory RestaurantServices.fromJson(Map<String, dynamic> json) =>
  //     _$RestaurantServicesFromJson(json);

  // Map<String, dynamic> toJson() => _$RestaurantServicesToJson(this);
}