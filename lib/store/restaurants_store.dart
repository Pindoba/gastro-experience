import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class RestaurantStore extends ChangeNotifier {
  final RestaurantsRepository _repository = RestaurantsRepository();
  List<Restaurants>? _restaurant = [];
  List<Restaurants>? _restaurantSearch = [];
  List<String> _listCozinha = ['teste'];
  bool isLoadRestaurant = false;

  restaurant() async {
    isLoadRestaurant = true;
    List<Restaurants> restaurant = await _repository.getRestaurants();
    isLoadRestaurant = false;
    // await Future.delayed(const Duration(seconds: 3));
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
        await Future.delayed(const Duration(seconds: 3));

    List<String> listaQualquer = [];
    for (var i = 0; i < _restaurant!.length; i++) {
      var restaurant = _restaurant![i];
      print(restaurant.cuisines);
      if (!_listCozinha.contains(restaurant.cuisines)) {
        listaQualquer.add(restaurant.cuisines);
      }
    }

    print(_listCozinha);
    notifyListeners();
    return _listCozinha = listaQualquer;
  }
}
