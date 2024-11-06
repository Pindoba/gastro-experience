import 'dart:convert';

class RestaurantServices {
  int? idService;
  String label;
  String description;
  RestaurantServices({
    this.idService,
    required this.label,
    required this.description,
  });

  RestaurantServices copyWith({
    int? idService,
    String? label,
    String? description,
  }) {
    return RestaurantServices(
      idService: idService ?? this.idService,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idService': idService,
      'label': label,
      'description': description,
    };
  }

  factory RestaurantServices.fromMap(Map<String, dynamic> map) {
    return RestaurantServices(
      idService: map['idService'] != null ? map['idService'] as int : null,
      label: map['label'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantServices.fromJson(String source) => RestaurantServices.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RestaurantServices(idService: $idService, label: $label, description: $description)';

  @override
  bool operator ==(covariant RestaurantServices other) {
    if (identical(this, other)) return true;
  
    return 
      other.idService == idService &&
      other.label == label &&
      other.description == description;
  }

  @override
  int get hashCode => idService.hashCode ^ label.hashCode ^ description.hashCode;
}
