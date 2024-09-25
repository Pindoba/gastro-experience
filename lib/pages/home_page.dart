import 'package:flutter/material.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';
import 'package:gastro_experience/widgets/card_restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    children: [
                      Text('Uninassau Indica'),


                      CardRestaurant(restaurant: resurantsRepository[0],)


                    ],
                  ),
                  ),
                  SizedBox(height: 50,),
                Container(
                  color: const Color.fromARGB(255, 51, 243, 33),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    children: [
                      Text('Uninassau Indica'),
                    ],
                  ),
                  ),
                    SizedBox(height: 50,),
                  Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    children: [
                      Text('Uninassau Indica'),
                    ],
                  ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: Text('Casa do padim')),
              // Container(color: Colors.blue,width: 100,height: 100,),
                  Container(
        color: Colors.amber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: Row(children: [
            CircleAvatar(
                      child: Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),),
                      Text('Sabores Cariri'),
                      ],),),
                      Container(
                child: Row(
                    children: [
                      Icon(Icons.search),
                      // TextFormField()
                    ],
                    ),
                    ),
                    Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),)
        
          ],
        ),
                  )
                ],
                )
    );
  }
}
