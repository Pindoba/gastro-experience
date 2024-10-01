import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/text_widget.dart';

class CardRestaurant extends StatefulWidget {
  final Restaurants restaurant;

  const CardRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<CardRestaurant> createState() => _CardRestaurantState();
}

class _CardRestaurantState extends State<CardRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Cores.card,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                SizedBox(
                  height: 175,
                  width: 280,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    child: Image.network(
                      widget.restaurant.mainImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.restaurant.stamp == null
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.safety_check_rounded,
                                  color: Cores.like,
                                  size: 28,
                                ),
                              ),
                        Row(
                          children: [
                            Container(
                              width: 33,
                              height: 33,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.yellow,
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Cores.like,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 33,
                              height: 33,
                              decoration: BoxDecoration(
                                color: widget.restaurant.isFavorite == null
                                    ? Colors.transparent
                                    : Cores.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  // borda
                                  color: Colors.yellow,
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Cores.like,
                                  size: 16,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.restaurant.isFavorite =
                                        widget.restaurant.isFavorite == null
                                            ? true
                                            : null;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              Padding(
                padding:
                    const EdgeInsets.only(top: 2, right: 8, left: 8, bottom: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: widget.restaurant.name,
                            color: Cores.fontTitle,
                            sizeText: 20,
                            bold: FontWeight.w600),
                      ],
                    ),
                    TextWidget(
                      text: widget.restaurant.address.street,
                      color: Cores.fontSubTitle,
                      sizeText: 16,
                    ),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 214,
                        //   child: TextWidget(text: restaurant.description, color: Cores.fontSubTitle, sizeText: 16,overflow: TextOverflow.ellipsis, maxLines: 1, )),
                      ],
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.restaurant_menu,
                          color: index < 3 ? Cores.like : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            5,
                            (index) => index < widget.restaurant.priceRange
                                ? Icon(
                                    Icons.attach_money_outlined,
                                    color: Cores.fontSubTitle,
                                    size: 16,
                                  )
                                : SizedBox(),
                          ),
                        ),
                        SizedBox(
                            width: 150,
                            child: TextWidget(
                              text: ' - italiana',
                              color: Cores.fontSubTitle,
                              sizeText: 14,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              alignment: TextAlign.start,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        widget.restaurant.regional == null
            ? SizedBox()
            : Positioned(
                bottom: 92,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Cores.fontTitle,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, top: 3, bottom: 3),
                        child: TextWidget(
                          text: 'Regional',
                          color: Cores.fontTitle,
                          sizeText: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
