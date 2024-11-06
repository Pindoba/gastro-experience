import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/api/api.dart';
// import 'package:dio/dio.dart';

class RestaurantFilter {
  String? name;
  int? cuisineId;
  int? serviceId;
  int? priceRange;

  RestaurantFilter({
    this.name,
    this.cuisineId,
    this.serviceId,
    this.priceRange,
  });

  String get queryParams {
    String params = "";

    if (name != null) params += "name=$name";
    if (cuisineId != null) params += "cuisineId=$cuisineId";
    if (serviceId != null) params += "serviceId=$serviceId";
    if (priceRange != null) params += "priceRange=$priceRange";

    return params;
  }
}

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


class RestaurantsRepository {
  Future getRestaurants() async {
    try {
      final response = await api.get<List>("/restaurants");

      if (response.data == null) return [];

      return response.data!.map((e) => Restaurants.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Restaurants>> searchRestaurants(RestaurantFilter filters, Pagination pagination) async {
    try {
      final response = await api.get<List<dynamic>>("/restaurants?${filters.queryParams}&${pagination.queryParams}");

      if (response.data == null) return [];
      
      return response.data!.map((e) => Restaurants.fromMap(e)).toList();
    } catch(e){
      print(e);
      throw Exception(e.toString());
    }
  }
}