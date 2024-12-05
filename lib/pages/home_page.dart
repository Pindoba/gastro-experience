import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';
import 'package:gastro_experience/pages/login_dialog.dart';
import 'package:gastro_experience/pages/search_page.dart';
import 'package:gastro_experience/store/restaurants_store.dart';
import 'package:gastro_experience/widgets/carrosel_widget.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:gastro_experience/style.dart';

class HomePage extends StatefulWidget {
  final RestaurantStore store;
  const HomePage({super.key, required this.store});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.store.init();
  }

  @override
  Widget build(BuildContext context) {
    final RestaurantStore restaurantStore = widget.store;
    final double widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: ListenableBuilder(
              listenable: restaurantStore,
              builder: (context, _) {
                return Column(
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
                            color: DefaultColors.white,
                            sizeText: 13,
                            fontRoboto: true,
                            bold: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      if (restaurantStore.isLoading)
                        const CircularProgressIndicator()
                      else
                        Container(
                          width: widthDevice - 50,
                          constraints: const BoxConstraints(
                            maxWidth: 1140,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: restaurantStore.cuisine.length,
                            itemBuilder: (context, index) {
                              String cuisine = restaurantStore.cuisine[index];

                              return CarroselWidget(
                                filtroRestaurant: restaurantStore.restaurants
                                    .where((e) => e.cuisine.label == cuisine)
                                    .toList(),
                                title: cuisine,
                              );
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 50,
                      )
                    ])
                  ],
                );
              }),
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
                          backgroundImage: AssetImage(Assets.logo),
                        ),
                      ),
                      widthDevice >= 590
                          ? TextWidget(
                              text: 'Comer Bem - Cariri',
                              sizeText: 20,
                              color: DefaultColors.white,
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
                          onFieldSubmitted: (_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (__) => SearchPage(
                                        initialTerm: _controller.text)));
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(bottom: 8.0),
                            hintText: 'Pesquise por tópicos ou palavras chaves',
                            hintStyle:
                                TextStyle(color: DefaultColors.fontSubTitle),
                          ),
                          style: TextStyle(color: DefaultColors.fontTitle),
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
                      onPressed: () {
                        LoginDialog.show(context);
                      },
                      icon: Icon(
                        Icons.menu,
                        color: DefaultColors.white,
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
