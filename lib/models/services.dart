// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Services {
  int? id;
  String label;
  String? description;
  
  Services({
    this.id,
    required this.label,
    this.description,
  });

  Services copyWith({
    int? id,
    String? label,
    String? description,
  }) {
    return Services(
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

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      id: map['id'] != null ? map['id'] as int : null,
      label: map['label'] as String,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) => Services.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Services(id: $id, label: $label, description: $description)';

  @override
  bool operator ==(covariant Services other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.label == label &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ description.hashCode;
}
