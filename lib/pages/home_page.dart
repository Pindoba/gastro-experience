import 'package:flutter/material.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';
import 'package:gastro_experience/widgets/card_restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
                children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                    'https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Uninassau Indica'),

                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios,size: 15),
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset - 280,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),


                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,size: 15),
                                  onPressed: () {
                                  _scrollController.animateTo(
                                  _scrollController.offset + 280,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),



                            ],
                          ),

                        ],
                      ),
                Container(
                  color: Colors.blue,
                  height: 300,
                  child: Row(
                           children: [
                             SizedBox(
                              width: MediaQuery.of(context).size.width,
                               child: ListView.builder(
                                controller: _scrollController,
                                  itemCount: restaurantsRepository.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return 
                                    SizedBox(
                                      height: 180,
                                      width: 280,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CardRestaurant(
                                          restaurant: restaurantsRepository[index],
                                        ),
                                      ),
                                    );
                                  }),
                             ),

                           ],
                         ),

                      
          
          
                      // CardRestaurant(restaurant: restaurantsRepository[0],)
 
                ),
                SizedBox(
                  height: 50,
                ),
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
                SizedBox(
                  height: 50,
                ),
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
          Positioned(bottom: 30, child: Text('Casa do padim')),
          // Container(color: Colors.blue,width: 100,height: 100,),
          Container(
            color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                            'https://mir-s3-cdn-cf.behance.net/project_modules/fs/ec4d9c98203055.5ed6dbcb95425.png'),
                      ),
                      Text('Sabores Cariri'),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      // TextFormField()
                    ],
                  ),
                ),
                Container(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                )
              ],
            ),
          )
                ],
              ),
        ));
  }
}
