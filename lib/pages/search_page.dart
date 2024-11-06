import 'package:flutter/material.dart';

import 'package:gastro_experience/controller/search_page_controller.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/widgets/restaurant.dart';

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
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return Column(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: maxColumns,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 5 / 7
                      ),
                      controller: _scrollController,
                      itemCount: controller.restaurants.length,
                      itemBuilder: (_, index){
                        Restaurants restaurant = controller.restaurants[index];
                    
                        return RestaurantWidget(restaurant: restaurant);
                      },
                    ),
                  ),
                ),
                if(controller.isLoading) const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CircularProgressIndicator(),
                  )
              ],
            );
          }
        ),
      )
    );
  }
}
