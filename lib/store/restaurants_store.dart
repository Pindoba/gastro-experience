import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class RestaurantStore extends ChangeNotifier {
  final RestaurantRepository _repository = RestaurantRepository();
  List<Restaurant>? _restaurant = [];
  List<Restaurant>? _restaurantSearch = [];
  List<String> _listCozinha = ['teste'];
  bool isLoadRestaurant = false;

  restaurant() async {
    isLoadRestaurant = true;
    List<Restaurant> restaurant = await _repository.getRestaurant();
    // await Future.delayed(const Duration(seconds: 3));
    isLoadRestaurant = false;
    listCuisine();
    notifyListeners();
    return _restaurant = restaurant;
  }

  getrestaurant() {
    return _restaurant;
  }

  getrestaurantSearch() {
    return _restaurantSearch;
  }

  getCuisine() {
    return _listCozinha;
  }

  searchRestaurant(name) {
    _restaurantSearch = _restaurant!
        .where((item) => item.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  listCuisine() async {
    await Future.delayed(const Duration(seconds: 1));

    List<String> listaQualquer = [];
    for (var i = 0; i < _restaurant!.length; i++) {
      var restaurant = _restaurant![i];
      if (!_listCozinha.contains(restaurant.cuisine.label)) {
        listaQualquer.add(restaurant.cuisine.label);
      }
    }

    notifyListeners();
    return _listCozinha = listaQualquer;
  }
}
