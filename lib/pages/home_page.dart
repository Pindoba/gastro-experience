import 'package:flutter/material.dart';
import 'package:gastro_experience/store/restaurants_store.dart';
import 'package:gastro_experience/widgets/card_restaurant.dart';
import 'package:gastro_experience/widgets/carrosel_widget.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:gastro_experience/style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final RestaurantStore restaurant = Provider.of<RestaurantStore>(context);
  //  Provider.of<RestaurantStore>(context).restaurant();

    final double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: widthDevice,
                    height: 350,
                    child: Image.network(
                      'https://www.bv.com.br/documents/d/bv-inspira/hobbies_que_dao_dinheiro-jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: -45,
                    child: TextWidget(
                      text: '''Casa do padim,
               Juazeiro do Norte, Ceará''',
                      color: Cores.white,
                      sizeText: 13,
                      fontRoboto: true,
                      bold: FontWeight.bold,
                    ),
                  )
                ],
              ),
              _controller.text == ''
                  ? Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Uninassau indica',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Novidades',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Novos Reviews',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Cozinha Italiana',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Regional',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: widthDevice - 50,
                        constraints: const BoxConstraints(
                          maxWidth: 1140,
                        ),
                        child: CarroselWidget(
                          filtroRestaurants: restaurant.getrestaurant(),
                          title: 'Cozinha Japonesa',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ])
                  : Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1120),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
                              GridView.builder(
                                padding: const EdgeInsets.all(20),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: widthDevice < 430
                                            ? 1
                                            : widthDevice < 720
                                                ? 2
                                                : 3,
                                        crossAxisSpacing: 10),
                                itemCount:
                                    restaurant.getrestaurantSearch().length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 280,
                                    width: 280,
                                    child: FittedBox(
                                      child: CardRestaurant(
                                        restaurant: restaurant
                                            .getrestaurantSearch()[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
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
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Image.network(
                            'https://png.pngtree.com/png-clipart/20230624/original/pngtree-cooking-logo-vector-png-image_9213639.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      widthDevice >= 590
                          ? TextWidget(
                              text: 'Sabores Cariri',
                              sizeText: 20,
                              color: Cores.white,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: _controller,
                          onChanged: restaurant.searchRestaurant,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(bottom: 8.0),
                            hintText: 'Pesquise por tópicos ou palavras chaves',
                            hintStyle: TextStyle(color: Cores.fontSubTitle),
                          ),
                          style: TextStyle(color: Cores.fontTitle),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: widthDevice >= 726 ? 135 : 0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Cores.white,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
