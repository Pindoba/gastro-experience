// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gastro_experience/models/cuisine.dart';

import 'package:gastro_experience/models/services.dart';
import 'package:gastro_experience/models/stamp.dart';

import 'address.dart';

class Restaurants {
  int? id;
  String name;
  int priceRange;
  Address address;
  String mainImage;
  String description;
  String phone;
  String whatsapp;
  bool isFavorite;
  bool isRegional;
  List<Services> services;
  List<Stamp> stamps;
  Cuisine cuisine;

  Restaurants({
    this.id,
    required this.name,
    required this.priceRange,
    required this.address,
    required this.mainImage,
    required this.description,
    required this.phone,
    required this.whatsapp,
    required this.isFavorite,
    required this.isRegional,
    required this.services,
    required this.stamps,
    required this.cuisine,
  });

  Restaurants copyWith({
    int? id,
    String? name,
    int? priceRange,
    Address? address,
    String? mainImage,
    String? description,
    String? phone,
    String? whatsapp,
    bool? isFavorite,
    bool? isRegional,
    List<Services>? services,
    List<Stamp>? stamps,
    Cuisine? cuisine,
  }) {
    return Restaurants(
      id: id ?? this.id,
      name: name ?? this.name,
      priceRange: priceRange ?? this.priceRange,
      address: address ?? this.address,
      mainImage: mainImage ?? this.mainImage,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      isFavorite: isFavorite ?? this.isFavorite,
      isRegional: isRegional ?? this.isRegional,
      services: services ?? this.services,
      stamps: stamps ?? this.stamps,
      cuisine: cuisine ?? this.cuisine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price_range': priceRange,
      'address': address.toMap(),
      'mainImage': mainImage,
      'description': description,
      'phoneNumber': phone,
      'whatsapp': whatsapp,
      'isFavorite': isFavorite,
      'isRegional': isRegional,
      'services': services.map((x) => x.toMap()).toList(),
      'stamps': stamps.map((x) => x.toMap()).toList(),
      'cuisine': cuisine.toMap(),
    };
  }

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    return Restaurants(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      priceRange: map['price_range'] as int,
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
      mainImage: map['mainImage'] as String,
      description: map['description'] as String,
      phone: map['phone_number'] as String,
      whatsapp: map['whatsapp'] as String,
      isFavorite: false,//map['isFavorite'] as bool,
      isRegional: map['isRegional'] as bool,
      services: List<Services>.from((map['services'] as List<dynamic>).map<Services>((x) => Services.fromMap(x as Map<String, dynamic>),),),
      stamps: List<Stamp>.from((map['stamps'] as List<dynamic>).map<Stamp>((x) => Stamp.fromMap(x as Map<String, dynamic>),),),
      cuisine: Cuisine.fromMap(map['cuisine']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurants.fromJson(String source) => Restaurants.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurants(id: $id, name: $name, priceRange: $priceRange, address: $address, mainImage: $mainImage, description: $description, phone: $phone, whatsapp: $whatsapp, isFavorite: $isFavorite, isRegional: $isRegional, services: $services, stamps: $stamps, cuisine: $cuisine)';
  }

  @override
  bool operator ==(covariant Restaurants other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.priceRange == priceRange &&
      other.address == address &&
      other.mainImage == mainImage &&
      other.description == description &&
      other.phone == phone &&
      other.whatsapp == whatsapp &&
      other.isFavorite == isFavorite &&
      other.isRegional == isRegional &&
      listEquals(other.services, services) &&
      listEquals(other.stamps, stamps);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      priceRange.hashCode ^
      address.hashCode ^
      mainImage.hashCode ^
      description.hashCode ^
      phone.hashCode ^
      whatsapp.hashCode ^
      isFavorite.hashCode ^
      isRegional.hashCode ^
      services.hashCode ^
      stamps.hashCode ^
      cuisine.hashCode;
  }
}
