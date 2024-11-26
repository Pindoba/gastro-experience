import 'dart:convert';

class Stamp {
  int? id;
  String name;
  String? description;
  Stamp({
    this.id,
    required this.name,
    this.description,
  });

  Stamp copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Stamp(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Stamp.fromMap(Map<String, dynamic> map) {
    return Stamp(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stamp.fromJson(String source) => Stamp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Stamp(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant Stamp other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
