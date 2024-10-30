import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class RestaurantStore extends ChangeNotifier {
  final RestaurantsRepository _repository = RestaurantsRepository();
  // final UserRepository _repositoryUser = UserRepository();
  List<Restaurants>? _restaurant = [];
  List<Restaurants>? _restaurantSearch = [];
  bool isLoadRestaurant = false;

  restaurant() async {
    isLoadRestaurant = true;
    List<Restaurants> restaurant = await _repository.getRestaurants();
    isLoadRestaurant = false;
    notifyListeners();
    return _restaurant = restaurant;
  }

  getrestaurant() {
    notifyListeners();
    return _restaurant;
  }

  getrestaurantSearch() {
    notifyListeners();
    return _restaurantSearch;
  }

  searchRestaurant(name) {
     _restaurantSearch =
        _restaurant!.firstWhere((element) => element.name == name) as List<Restaurants>?;
        notifyListeners();
    // return _restaurantSearch = restaurantSearch;
  }
}
