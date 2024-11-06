import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/stars.dart';
import 'package:gastro_experience/widgets/text.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurants restaurant;
  final Random random = Random();
  RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    int rating = random.nextInt(5);
    
    return ClipRRect(
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
                    child: StarsIcon(rating: rating),
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
    );
  }
}