import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class SearchPageController extends ChangeNotifier {
  bool isLoading = true;
  bool hasError = false;
  List<Restaurants> restaurants = [];
  
  final RestaurantFilter filters = RestaurantFilter();
  final RestaurantsRepository _repository = RestaurantsRepository();

  set nameFilter(String name) {
    filters.name = name;
  }

  Future<void> searchRestaurants() async {
    isLoading = true;
    notifyListeners();

    try {
      List<Restaurants> newRestaurants = await _repository.searchRestaurants(filters);

      await Future.delayed(const Duration(seconds: 2));
      
      restaurants.addAll(newRestaurants);
      restaurants.addAll(newRestaurants);
    } catch (e) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}