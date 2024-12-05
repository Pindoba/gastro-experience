import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class RestaurantStore extends ChangeNotifier {
  final RestaurantRepository _repository = RestaurantRepository();
  List<Restaurant> _restaurant = [];
  List<Restaurant> _restaurantSearch = [];
  List<String> _listCozinha = [];
  bool get isLoadRestaurant => _restaurant.isEmpty;

  init() async {
    _restaurant = [];
    _listCozinha = [];
    List<Restaurant> restaurant = await _repository.getRestaurant();
    _restaurant = restaurant;
    listCuisine();

    notifyListeners();
  }

  List<Restaurant> get restaurants => _restaurant;

  bool get isLoading => isLoadRestaurant;

  List<Restaurant> get filteredRestaraunts => _restaurantSearch;

  List<String> get cuisine => _listCozinha;

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
