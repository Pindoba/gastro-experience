import 'dart:convert';
import 'package:flutter/foundation.dart';

class Avaliation {
  final int restaurantId;
  final String description;
  final List<Answers> answers;

  Avaliation({
    required this.restaurantId,
    required this.description,
    required this.answers,
  });

  Avaliation copyWith({
    int? restaurantId,
    String? description,
    List<Answers>? answers,
  }) {
    return Avaliation(
      restaurantId: restaurantId ?? this.restaurantId,
      description: description ?? this.description,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurantId': restaurantId,
      'description': description,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Avaliation.fromMap(Map<String, dynamic> map) {
    return Avaliation(
      restaurantId: map['restaurantId'] as int,
      description: map['description'] as String,
      answers: List<Answers>.from((map['answers'] as List<int>).map<Answers>((x) => Answers.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Avaliation.fromJson(String source) => Avaliation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Avaliation(restaurantId: $restaurantId, description: $description, answers: $answers)';

  @override
  bool operator ==(covariant Avaliation other) {
    if (identical(this, other)) return true;
  
    return 
      other.restaurantId == restaurantId &&
      other.description == description &&
      listEquals(other.answers, answers);
  }

  @override
  int get hashCode => restaurantId.hashCode ^ description.hashCode ^ answers.hashCode;
}

class Answers {
  int questionId;
  int rating;
  Answers({
    required this.questionId,
    required this.rating,
  });

  Answers copyWith({
    int? questionId,
    int? rating,
  }) {
    return Answers(
      questionId: questionId ?? this.questionId,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionId': questionId,
      'rating': rating,
    };
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      questionId: map['questionId'] as int,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) => Answers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answers(questionId: $questionId, rating: $rating)';

  @override
  bool operator ==(covariant Answers other) {
    if (identical(this, other)) return true;
  
    return 
      other.questionId == questionId &&
      other.rating == rating;
  }

  @override
  int get hashCode => questionId.hashCode ^ rating.hashCode;
}
