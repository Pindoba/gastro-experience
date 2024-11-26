import 'package:flutter/material.dart';

import 'package:gastro_experience/controller/search_page_controller.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/widgets/restaurant.dart';
import 'package:gastro_experience/widgets/search_filters.dart';
import 'package:gastro_experience/widgets/text.dart';

class SearchPage extends StatefulWidget {
  final String initialTerm;

  const SearchPage({
    super.key, 
    required this.initialTerm,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  final SearchPageController controller = SearchPageController();

  @override
  void initState(){
    super.initState();
    _scrollController.addListener(onScroll);
    controller.nameFilter = widget.initialTerm;
    controller.searchRestaurants();
  }

   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !controller.isLoading) {
      controller.searchRestaurants();
    }
  }

  @override
  Widget build(BuildContext context) {
    int maxColumns = (MediaQuery.of(context).size.width / 245).toInt();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: controller.hasError ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  SearchFilters(onSearch: controller.updateFiltersAndRefresh),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: maxColumns,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 5 / 7
                        ),
                        controller: _scrollController,
                        itemCount: controller.restaurants.length + 1,
                        itemBuilder: (_, index){
                          bool isLast = index == controller.restaurants.length;
          
                          if (isLast){
                            if (!controller.isLoading) return const SizedBox();
          
                            return const FractionallySizedBox(
                              widthFactor: 0.25,
                              heightFactor: 0.25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
          
                          Restaurants restaurant = controller.restaurants[index];
                      
                          return RestaurantWidget(restaurant: restaurant);
                        },
                      ),
                    ),
                  ),
                  if (controller.hasError) DefaultText.normal(controller.errorMessage),
                ],
              );
            }
          ),
        ),
      )
    );
  }
}
