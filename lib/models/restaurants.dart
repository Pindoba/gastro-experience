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
    this.whatsapp,
    this.isFavorite,
    this.stamp,
    this.regional,
    this.services,
  });

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    // print(map);
    // print(map['name']);
    // print(map['price_range']);
    // print(map['address']);

    return Restaurants(
      idRestaurant: map['id'] as int,
      name: map['name'] as String,
      description: 'dfdfgdgdgfdgddfgdgdfgd', //map['description'] as String,
      // address: Address.fromJson(map['address']),
      address: Address(
          city: 'Juazeiro do norte',
          idAddress: 01,
          neighborhood: 'Tiradentes',
          number: 345,
          street: 'Radialista Coelho Alves',
          zipcode: '63031-000',
          lat: 1,
          lng: 1),
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
