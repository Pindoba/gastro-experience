// import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'address.dart';

class Restaurants {
  int idRestaurant;
  String name;
  int priceRange;
  Address address;
  String mainImage;
  String description;
  String openingHours;
  String phoneNumber;
  String? whatsapp;
  String cuisines;
  bool? isFavorite;
  bool? stamp;
  bool? regional;
  List? services;

  Restaurants({
    required this.idRestaurant,
    required this.name,
    required this.priceRange,
    required this.address,
    required this.description,
    required this.mainImage,
    required this.openingHours,
    required this.phoneNumber,
    required this.cuisines,
    this.whatsapp,
    this.isFavorite,
    this.stamp,
    this.regional,
    this.services,
  });

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    return Restaurants(
      idRestaurant: map['id'] as int,
      name: map['name'] as String,
      description: 'dfdfgdgdgfdgddfgdgdfgd', //map['description'] as String,
      address: Address.fromMap(map['address']),
      cuisines: map['cuisine']['label'] as String,
      
      openingHours: '',
      phoneNumber: '',
      priceRange: map['price_range'] as int,
      mainImage:
          'https://cdn.blablacar.com/wp-content/uploads/br/2024/05/05094735/comidas-sao-joao-2.webp',
    );
  }

  // String toJson() => json.encode(toMap());

  factory Restaurants.fromJson(String source) =>
      Restaurants.fromMap(json.decode(source) as Map<String, dynamic>);
}
