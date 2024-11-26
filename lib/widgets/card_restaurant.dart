import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/pages/details_page.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/text_widget.dart';

class CardRestaurant extends StatefulWidget {
  final Restaurants restaurant;

  const CardRestaurant({
    super.key,
    required this.restaurant,
  });

  @override
  State<CardRestaurant> createState() => _CardRestaurantState();
}

class _CardRestaurantState extends State<CardRestaurant> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(restaurant: widget.restaurant),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            color: DefaultColors.card,
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
                      child: SizedBox(
                        width: 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.restaurant.stamps.isNotEmpty
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Icon(
                                      Icons.workspace_premium_outlined,
                                      color: DefaultColors.like,
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
                                      color: DefaultColors.like,
                                      size: 16,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 33,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    color: widget.restaurant.isFavorite == null
                                        ? Colors.transparent
                                        : DefaultColors.white,
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
                                      color: DefaultColors.like,
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.restaurant.isFavorite = !widget.restaurant.isFavorite;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 8, left: 8, bottom: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 240,
                            child: TextWidget(
                                text: widget.restaurant.name,
                                color: DefaultColors.fontTitle,
                                sizeText: 20,
                                maxLines: 1,
                                alignment: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                bold: FontWeight.w600),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: widget.restaurant.address.street,
                        color: DefaultColors.fontSubTitle,
                        sizeText: 16,
                      ),
                      const Row(
                        children: [],
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.restaurant_menu,
                            color: index < 3 ? DefaultColors.like : Colors.grey,
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
                                      color: DefaultColors.fontSubTitle,
                                      size: 16,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                          SizedBox(
                              width: 150,
                              child: TextWidget(
                                text: ' - ${widget.restaurant.cuisine.label}',
                                color: DefaultColors.fontSubTitle,
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
          !widget.restaurant.isRegional
              ? const SizedBox()
              : Positioned(
                  bottom: 92,
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: DefaultColors.fontTitle,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 3, bottom: 3),
                          child: TextWidget(
                            text: 'Regional',
                            color: DefaultColors.fontTitle,
                            sizeText: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
