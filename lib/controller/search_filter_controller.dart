import 'package:flutter/material.dart';
import 'package:gastro_experience/models/cuisine.dart';
import 'package:gastro_experience/models/restaurant_filter.dart';
import 'package:gastro_experience/models/stamp.dart';
import 'package:gastro_experience/repository/cuisine_respository.dart';

class SearchFilterController extends ChangeNotifier {
  bool isLoading = true;
  Cuisine? selectedCuisine;
  Stamp? selectedStamp;

  final CuisineRepository _cuisineRepository = CuisineRepository();

  final RestaurantFilter filters = RestaurantFilter();
  final Function(RestaurantFilter filters) onSearch;

  List<Stamp> stamps = [
    Stamp(
      name: "Uninassau Indica"
    ),
    Stamp(
      name: "Outro Selo"
    ),
  ];
  List<Cuisine> cuisines = [];

  SearchFilterController({required this.onSearch});

  clear(){
    toggleStamp(null);
    setCuisine(null);

    onSearch(filters);

    notifyListeners();
  }

  toggleStamp(Stamp? stamp){
    if (selectedStamp == stamp) stamp = null;

    selectedStamp = stamp;

    filters.stampId = stamp?.id;

    notifyListeners();

    onSearch(filters);
  }

  setCuisine(Cuisine? cuisine){
    selectedCuisine = cuisine;

    filters.cuisineId = cuisine?.id;

    notifyListeners();
    
    onSearch(filters);
  }

  Future<void> init() async {
    await Future.wait([
      fetchCuisines(),
      fetchStamps()
    ]);

    isLoading = false;
    notifyListeners();    
  }

  Future<void> fetchCuisines() async {
    cuisines = await _cuisineRepository.getCuisines();
  }

  Future<void> fetchStamps() async {

  }
}