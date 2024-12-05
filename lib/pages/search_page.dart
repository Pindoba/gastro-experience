import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';

import 'package:gastro_experience/controller/search_page_controller.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/pages/home_page.dart';
import 'package:gastro_experience/style.dart';
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
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _scrollController.addListener(onScroll);
    controller.nameFilter = widget.initialTerm;
    controller.searchRestaurant();
  }

   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !controller.isLoading) {
      controller.searchRestaurant();
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    int maxColumns = (widthDevice / 245).toInt();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: controller.hasError ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage())),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(Assets.logo),
                          ),
                        ),
                      ),
                      widthDevice >= 590
                          ? DefaultText.normal(
                              'Sabores Cariri',
                              isInverted: true,
                            )
                          : const SizedBox(),
                      Expanded(child: Container(),),
                      Container(
                        height: 40,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            ),
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: TextFormField(
                                controller: _editingController,
                                onFieldSubmitted: (_) {
                                  Navigator.of(context)
                                    .push(MaterialPageRoute(
                                      builder: (__) => SearchPage(initialTerm: _editingController.text)
                                    ));
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(bottom: 8.0),
                                  hintText: 'Pesquise por tópicos ou palavras chaves',
                                  hintStyle: TextStyle(color: DefaultColors.fontSubTitle),
                                ),
                                style: TextStyle(color: DefaultColors.fontTitle),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
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
          
                          Restaurant restaurant = controller.restaurants[index];
                      
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
