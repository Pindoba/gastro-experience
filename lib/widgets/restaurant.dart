import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/pages/details_page.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/stars.dart';
import 'package:gastro_experience/widgets/text.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (__) => DetailsPage(restaurant: restaurant)
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: DefaultColors.primary
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(restaurant.mainImage)
                    ),
                  ),
                  child: Container()
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText.title(restaurant.name),
                    DefaultText.normal(restaurant.address.street),
                    SizedBox(
                      height: 24,
                      child: StarsIcon(rating: restaurant.rating.toInt()),
                    ),
                    DefaultText.normal(
                      "${"".padLeft(restaurant.priceRange, "\$")} - ${restaurant.cuisine.label}",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}