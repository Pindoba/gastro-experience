class RestaurantFilter {
  String? name;
  int? cuisineId;
  int? serviceId;
  int? stampId;
  int? priceRange;

  RestaurantFilter({
    this.name,
    this.cuisineId,
    this.serviceId,
    this.priceRange,
    this.stampId
  });

  String get queryParams {
    String params = "";

    if (name != null) params += "name=$name";
    if (cuisineId != null) params += "cuisineId=$cuisineId";
    if (serviceId != null) params += "serviceId=$serviceId";
    if (stampId != null) params += "stampId=$stampId";
    if (priceRange != null) params += "priceRange=$priceRange";

    return params;
  }
}