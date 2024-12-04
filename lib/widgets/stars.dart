import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';

class StarsIcon extends StatelessWidget {
  final int maxStars;
  final int rating;
  final bool isInteractive;
  final Function(int)? onClick;
  final double scale;
  final MainAxisAlignment? alignment;
  const StarsIcon({super.key, required this.rating, this.maxStars = 5, this.isInteractive = false, this.scale = 1, this.alignment, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: List.generate(
        maxStars * 2,
        (index){
          if (index % 2 != 0) return const SizedBox(width: 8,);
          int realIndex = index ~/ 2;
          String image = realIndex < rating ? Assets.ratingIconFilled : Assets.ratingIcon;

          if (isInteractive) {
            return GestureDetector(
              onTap: () => onClick == null ? null : onClick!(realIndex + 1),
              child: Image.asset(image, scale: scale)
            );
          }

          return Image.asset(image, scale: scale);
        }
      ),
    );
  }
}