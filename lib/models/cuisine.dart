import 'dart:convert';

class Cuisine {
  int? id;
  String label;
  String? description;

  Cuisine({
    this.id,
    required this.label,
    this.description,
  });

  Cuisine copyWith({
    int? id,
    String? label,
    String? description,
  }) {
    return Cuisine(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'description': description,
    };
  }

  factory Cuisine.fromMap(Map<String, dynamic> map) {
    return Cuisine(
      id: map['id'] != null ? map['id'] as int : null,
      label: map['label'] as String,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cuisine.fromJson(String source) => Cuisine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cuisine(id: $id, label: $label, description: $description)';

  @override
  bool operator ==(covariant Cuisine other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.label == label &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ description.hashCode;
}
