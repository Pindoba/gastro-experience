import 'package:flutter/material.dart';
import 'package:gastro_experience/repository/restaurants_repository.dart';
import 'package:gastro_experience/widgets/card_restaurant.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:gastro_experience/style.dart';

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
                Stack(children: [
                   SizedBox(width: MediaQuery.of(context).size.width,
                   height: 400,
                    child: Image.network(
                        'https://www.bv.com.br/documents/d/bv-inspira/hobbies_que_dao_dinheiro-jpg',fit: BoxFit.cover,),
                  ),
                   Positioned(bottom: 10,
                   left: -45,
                    child: TextWidget(
                      text:'''Casa do padim,
                 Juazeiro do Norte, Ceará'''
                   ,color: Cores.white,
                   sizeText: 13,
                   fontRoboto: true,
                   bold: FontWeight.bold,
                   ),)],
                ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           TextWidget(
                            text: 'Uninassau Indica',
                            sizeText: 34,
                            bold: FontWeight.bold, 
                            color: Cores.primary),

                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.arrow_back_ios,size: 15),
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset - 280,
                                      duration: const Duration(milliseconds: 500),
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
          // Positioned(bottom: 30, child: Text('Casa do padim')),
          // Container(color: Colors.blue,width: 100,height: 100,),
          Container(


             decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),



            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox( height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Image.network(
                                'https://png.pngtree.com/png-clipart/20230624/original/pngtree-cooking-logo-vector-png-image_9213639.png', fit: BoxFit.cover,),
                          ),
                        ),
                        TextWidget(text: 'Sabores Cariri',sizeText: 20,color: Cores.fontSubTitle,),
                      ],
                    ),
                  ),
              
              
                  Container(
                        height: 40,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: TextFormField(
                             controller: TextEditingController(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 8.0),
                              hintText: 'Pesquise por tópicos ou palavras chaves',
                              hintStyle: TextStyle(color: const Color.fromARGB(255, 78, 78, 78)),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
              ),
              
              
              
              
              
                  Container(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.menu,color: Colors.white,size: 30,),),
                  )
                ],
              ),
            ),
          )
                ],
              ),
        ));
  }
}
