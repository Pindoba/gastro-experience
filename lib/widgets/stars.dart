import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';

class StarsIcon extends StatelessWidget {
  final int maxStars;
  final int rating;
  const StarsIcon({super.key, required this.rating, this.maxStars = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxStars * 2,
        (index){
          if (index % 2 != 0) return const SizedBox(width: 8,);
          int realIndex = index ~/ 2;
          String image = realIndex < rating ? Assets.ratingIconFilled : Assets.ratingIcon;

          return Image.asset(image);
        }
      ),
    );
  }
}