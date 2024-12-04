import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurant_filter.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';

class SearchPageController extends ChangeNotifier {
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = "";
  final Pagination _pagination = Pagination(page: 0, totalPerPage: 1);
  
  int get page => _pagination.page;
  bool isLastPage = false;
  List<Restaurant> restaurants = [];
  
  RestaurantFilter filters = RestaurantFilter();
  final RestaurantRepository _repository = RestaurantRepository();

  set nameFilter(String name) {
    filters.name = name;
  }

  Future<void> updateFiltersAndRefresh(RestaurantFilter newFilters) async {
    filters = newFilters;
    _pagination.page = 0;
    restaurants = [];

    await searchRestaurant();
  }

  Future<void> searchRestaurant() async {
    if(isLastPage) return;
    _pagination.page++;

    isLoading = true;
    notifyListeners();
    errorMessage = "";

    try {
      List<Restaurant> newRestaurant = await _repository.searchRestaurant(filters, _pagination);

      await Future.delayed(const Duration(seconds: 2));
      
      restaurants.addAll(newRestaurant);
      
      isLastPage = newRestaurant.length < _pagination.totalPerPage;
    } catch (e) {
      hasError = true;
      errorMessage = "Ocorreu um erro! Tente novamente em alguns instantes.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}