
import 'dart:convert';

class Address {
  int? idAddress;
  String street;
  String number;
  String neighborhood;
  String zipcode;
  String city;
  double? lat;
  double? lng;

  Address({
    this.idAddress,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.zipcode,
    required this.city,
    this.lat,
    this.lng,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      // idAddress: map['id'] as int,
      street: map['street'] as String,
      number: map['number'] as String,
      neighborhood: map['neightborhood'] as String,
      city: map['city'] as String,
      zipcode: map["zipcode"] as String,
      // lat: map["lat"] as double,
      // lng: map["lng"] as double,
    );
  }

  // String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
