import 'package:flutter/material.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.brown),
      height: 200,
      width: 200,
      child: Column(
        children: [
          Stack(children: [
            Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.safety_check_rounded),
                Row(children: [Icon(Icons.share_sharp),Icon(Icons.favorite)],),
                // Text('Compartilhar, e favorito')
                ],
            ),
          ],),
          Text('Nome'),
          Text('Endereço'),
          Text('Avaliação'),
          Text('\$\$\$ - Italiana'),
        ],),)
    
    
    
    
    ;
  }
}