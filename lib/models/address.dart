// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  int? id;
  String street;
  String number;
  String neighborhood;
  String zipcode;
  String city;
  double? lat;
  double? lng;

  Address({
    this.id,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.zipcode,
    required this.city,
    this.lat,
    this.lng,
  });

  Address copyWith({
    int? id,
    String? street,
    String? number,
    String? neighborhood,
    String? zipcode,
    String? city,
    double? lat,
    double? lng,
  }) {
    return Address(
      id: id ?? this.id,
      street: street ?? this.street,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      zipcode: zipcode ?? this.zipcode,
      city: city ?? this.city,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'zipcode': zipcode,
      'city': city,
      'lat': lat,
      'lng': lng,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as int : null,
      street: map['street'] as String,
      number: map['number'] as String,
      neighborhood: map['neighborhood'] as String,
      zipcode: map['zipcode'] as String,
      city: map['city'] as String,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, street: $street, number: $number, neighborhood: $neighborhood, zipcode: $zipcode, city: $city, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.street == street &&
      other.number == number &&
      other.neighborhood == neighborhood &&
      other.zipcode == zipcode &&
      other.city == city &&
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      street.hashCode ^
      number.hashCode ^
      neighborhood.hashCode ^
      zipcode.hashCode ^
      city.hashCode ^
      lat.hashCode ^
      lng.hashCode;
  }
}
