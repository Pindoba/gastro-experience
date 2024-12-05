import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class RestaurantStore extends ChangeNotifier {
  final RestaurantRepository _repository = RestaurantRepository();
  List<Restaurant>? _restaurant = [];
  List<Restaurant>? _restaurantSearch = [];
  List<String> _listCozinha = [];
  bool isLoadRestaurant = true;

  restaurant() async {
    isLoadRestaurant = true;
    List<Restaurant> restaurant = await _repository.getRestaurant();
    _restaurant = restaurant;
    listCuisine();
    isLoadRestaurant = false;
    notifyListeners();
  }

  getrestaurant() {
    return _restaurant;
  }

  load() {
    return isLoadRestaurant;
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

  listCuisine() {
    List<String> listaQualquer = [];
    for (var i = 0; i < _restaurant!.length; i++) {
      var restaurant = _restaurant![i];
      if (!_listCozinha.contains(restaurant.cuisine.label)) {
        listaQualquer.add(restaurant.cuisine.label);
      }
    }
    listaQualquer = listaQualquer.toSet().toList();
    notifyListeners();
    return _listCozinha = listaQualquer;
  }
}
