import 'package:gastro_experience/models/cuisine.dart';
import 'package:gastro_experience/api/api.dart';

class CuisineRepository {
  Future<List<Cuisine>> getCuisines() async {
    try {
      final response = await api.get<List>("/cuisines");

      if (response.data == null) return [];

      return response.data!.map((e) => Cuisine.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }

    return [];
  }
}