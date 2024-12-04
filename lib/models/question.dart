import 'dart:convert';

class Question {
  final int id;
  final String question;
  final int? weight;
  
  Question({
    required this.id,
    required this.question,
    this.weight,
  });


  Question copyWith({
    int? id,
    String? question,
    int? weight,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'weight': weight,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      question: map['question'] as String,
      weight: map['weight'] != null ? map['weight'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Question(id: $id, question: $question, weight: $weight)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.question == question &&
      other.weight == weight;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ weight.hashCode;
}
