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


class RestaurantsRepository {
  Future getRestaurants() async {
    List<Restaurants> listRestaurants = [
      
    ];
    try {
      final response = await api.get("/restaurants");
      for (int i = 0; i < response.data.length; i++) {
        listRestaurants.add(Restaurants.fromMap(response.data[i]));
        // print(listRestaurants[i].name);
      }
      return listRestaurants;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Restaurants>> searchRestaurants(RestaurantFilter filters) async {
    try {
      final response = await api.get<List<dynamic>>("/restaurants?${filters.queryParams}");

      if (response.data == null) throw Exception("Cannot be null");
      
      return response.data!.map((e) => Restaurants.fromMap(e)).toList();
    } catch(e){
      throw Exception(e.toString());
    }
  }
}