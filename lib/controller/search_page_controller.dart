import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class SearchPageController extends ChangeNotifier {
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = "";
  final Pagination _pagination = Pagination(page: 0, totalPerPage: 1);
  
  int get page => _pagination.page;
  bool isLastPage = false;
  List<Restaurants> restaurants = [];
  
  final RestaurantFilter filters = RestaurantFilter();
  final RestaurantsRepository _repository = RestaurantsRepository();

  set nameFilter(String name) {
    filters.name = name;
  }

  Future<void> searchRestaurants() async {
    if(isLastPage) return;
    _pagination.page++;

    isLoading = true;
    notifyListeners();
    errorMessage = "";

    try {
      List<Restaurants> newRestaurants = await _repository.searchRestaurants(filters, _pagination);

      await Future.delayed(const Duration(seconds: 2));
      
      restaurants.addAll(newRestaurants);
      
      isLastPage = newRestaurants.length < _pagination.totalPerPage;
    } catch (e) {
      hasError = true;
      errorMessage = "Ocorreu um erro! Tente novamente em alguns instantes.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}