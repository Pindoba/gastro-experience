import 'package:gastro_experience/models/restaurant_filter.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/api/api.dart';

class Pagination {
  int page;
  int totalPerPage;

  Pagination({
    required this.page,
    required this.totalPerPage,
  });

  String get queryParams {
    return "page=$page&totalPerPage=$totalPerPage";
  }
}


class RestaurantRepository {
  Future getRestaurant() async {
    try {
      final response = await api.get<List>("/restaurants?page=1&totalPerPage=50");

      if (response.data == null) return [];
      // print(response.data);

      return response.data!.map((e) => Restaurant.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Restaurant>> searchRestaurant(RestaurantFilter filters, Pagination pagination) async {
    try {
      final response = await api.get<List<dynamic>>("/restaurants?${filters.queryParams}&${pagination.queryParams}");

      if (response.data == null) return [];
      
      return response.data!.map((e) => Restaurant.fromMap(e)).toList();
    } catch(e){
      print(e);
      throw Exception(e.toString());
    }
  }
}
