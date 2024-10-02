import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/card_restaurant.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:hovering/hovering.dart';

class CarroselWidget extends StatefulWidget {
  final List<Restaurants> filtroRestaurants;
  final String title;
  const CarroselWidget(
      {super.key, required this.filtroRestaurants, required this.title});

  @override
  State<CarroselWidget> createState() => _CarroselWidgetState();
}

class _CarroselWidgetState extends State<CarroselWidget> {
  final ScrollController _scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    text: widget.title,
                    sizeText: 34,
                    bold: FontWeight.bold,
                    color: Cores.primary),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 15),
                      onPressed: () {
                        _scrollController2.animateTo(
                          _scrollController2.offset - 280,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 15),
                      onPressed: () {
                        _scrollController2.animateTo(
                          _scrollController2.offset + 280,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          height: 300,
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 1140,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: ListView.builder(
                      controller: _scrollController2,
                      itemCount: widget.filtroRestaurants.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return HoverAnimatedContainer(
                          hoverWidth: 290,
                          hoverHeight: 290,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            height: 280,
                            width: 280,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CardRestaurant(
                                restaurant: widget.filtroRestaurants[index],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
