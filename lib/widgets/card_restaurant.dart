import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({super.key, required this.restaurant});
  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.brown),
      height: 200,
      width: 200,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 110,
                child: Image.network(
                    restaurant.mainImage,fit: BoxFit.cover,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.safety_check_rounded),
                  Row(
                    children: [Icon(Icons.share_sharp), Icon(Icons.favorite)],
                  ),
                  // Text('Compartilhar, e favorito')
                ],
              ),
            ],
          ),
          Text(restaurant.name),
          Text(restaurant.address.street),
          Text(restaurant.address.neighborhood),
          Text('Avaliação'),
          Text('\$\$\$ - Italiana'),
        ],
      ),
    );
  }
}
