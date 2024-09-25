// import 'package:json_annotation/json_annotation.dart';

// part 'address.g.dart';

// @JsonSerializable()
class Address {
  int idAddress;
  String street;
  int number;
  String neighborhood;
  String zipcode;
  String city;
  double lat;
  double lng;

  Address({
    required this.idAddress,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.zipcode,
    required this.city,
    required this.lat,
    required this.lng,
  });

  // factory Address.fromJson(Map<String, dynamic> json) =>
  //     _$AddressFromJson(json);

  // Map<String, dynamic> toJson() => _$AddressToJson(this);
}