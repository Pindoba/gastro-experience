import 'dart:convert';

class AuthDTO {
  final String token;

  AuthDTO({
    required this.token,
  });

  AuthDTO copyWith({
    String? token,
  }) {
    return AuthDTO(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory AuthDTO.fromMap(Map<String, dynamic> map) {
    return AuthDTO(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthDTO.fromJson(String source) => AuthDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthDTO(token: $token)';

  @override
  bool operator ==(covariant AuthDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
