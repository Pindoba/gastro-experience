import 'package:gastro_experience/api/api.dart';
import 'package:gastro_experience/models/avaliation.dart';
import 'package:gastro_experience/models/question.dart';

class AvaliationRepository {
  Future<List<Question>> getQuestions() async {
    try {
      final response = await api.get<List>("/questions");

      if (response.data == null) return [];

      return response.data!.map((e) => Question.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    
    return [];
  }

  Future<bool> createAvaliation(Avaliation avaliation) async {
    try {
      await api.post("/avaliation", data: avaliation.toMap());

      return true;
    } catch (e) {
      print(e);
    }
    
    return false;
  }
}
