import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column(
          children:[ 
            Stack(
            children: [
              Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),
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
        ),
        ],
        )
    );
  }
}
