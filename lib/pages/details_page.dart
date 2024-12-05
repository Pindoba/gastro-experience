import 'package:flutter/material.dart';
import 'package:gastro_experience/assets.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/models/services.dart';
import 'package:gastro_experience/pages/avaliation_page.dart';
import 'package:gastro_experience/pages/home_page.dart';
import 'package:gastro_experience/store/auth_store.dart';
import 'package:gastro_experience/widgets/stars.dart';
import 'package:gastro_experience/widgets/text.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:gastro_experience/style.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Restaurant restaurant;
  const DetailsPage({super.key, required this.restaurant});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = widget.restaurant;
    AuthStore authStore = context.watch();

    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: widthDevice,
                height: 350,
                child: Image.network(
                  restaurant.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth: widthDevice - 80),
                                    // width: widthDevice - 80,
                                    child: TextWidget(
                                      text: restaurant.name,
                                      sizeText: 32,
                                      alignment: TextAlign.left,
                                      bold: FontWeight.w500,
                                      color: DefaultColors.primary,
                                    ),
                                  ),
                                  restaurant.stamps.isNotEmpty
                                      ? const Icon(
                                          Icons.workspace_premium_outlined,
                                        )
                                      : const SizedBox(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: restaurant.isFavorite == true
                                          ? Colors.red
                                          : DefaultColors.fontSubTitle,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  StarsIcon(
                                    rating: restaurant.rating.toInt(),
                                    scale: 4,
                                  ),
                                  if (authStore.isLogged)
                                    IconButton(
                                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AvaliationPage(restaurant: restaurant))),
                                      icon: const Icon(Icons.edit),
                                    )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      5,
                                      (index) => index < restaurant.priceRange
                                          ? Icon(
                                              Icons.attach_money_outlined,
                                              color: DefaultColors.fontSubTitle,
                                              size: 16,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: TextWidget(
                                      text: ' - ${restaurant.cuisine.label}',
                                      color: DefaultColors.fontSubTitle,
                                      sizeText: 14,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      alignment: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: widget
                                                  .restaurant.address.street,
                                              sizeText: 16,
                                              color: DefaultColors.fontSubTitle,
                                              alignment: TextAlign.left,
                                            ),
                                            TextWidget(
                                              text:
                                                  ' nº ${(restaurant.address.number)}',
                                              sizeText: 16,
                                              color: DefaultColors.fontSubTitle,
                                              alignment: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        TextWidget(
                                          text:
                                              'Bairro: ${(restaurant.address.neighborhood)}',
                                          sizeText: 16,
                                          color: DefaultColors.fontSubTitle,
                                          alignment: TextAlign.left,
                                        ),
                                        TextWidget(
                                          text: restaurant.address.city,
                                          sizeText: 16,
                                          color: DefaultColors.fontSubTitle,
                                          alignment: TextAlign.left,
                                        ),
                                      ],
                                    )
                                  ])
                            ]),
                        const SizedBox(
                          width: 10,
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      width: widthDevice - 20,
                      child: TextWidget(
                        text: restaurant.description,
                        color: DefaultColors.fontTitle,
                        sizeText: 16,
                        alignment: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: 'Fotos do ambiente',
                            color: DefaultColors.fontTitle,
                            sizeText: 18,
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.arrow_back_ios, size: 15),
                                onPressed: () {
                                  _scrollController.animateTo(
                                    _scrollController.offset - 280,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 15),
                                onPressed: () {
                                  _scrollController.animateTo(
                                    _scrollController.offset + 280,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    height: 250,
                    child: Row(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 1120,
                          ),
                          child: SizedBox(
                            width: widthDevice - 50,
                            child: ListView.builder(
                                controller: _scrollController,
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return HoverAnimatedContainer(
                                    hoverWidth: 290,
                                    hoverHeight: 290,
                                    curve: Curves.easeInOut,
                                    duration: const Duration(milliseconds: 500),
                                    cursor: SystemMouseCursors.click,
                                    child: SizedBox(
                                      height: 280,
                                      width: 280,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          restaurant.mainImage,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              restaurant.services.length + 1, (i) {
                            if (i == 0) {
                              return DefaultText.subtitle(
                                "Instalações e Serviços",
                              );
                            }
                            Services service = restaurant.services[i - 1];

                            return DefaultText.normal(service.label);
                          })
                          /* const TextWidget(
                            text: 'Instalações e Serviços',
                            sizeText: 18,
                            bold: FontWeight.bold,
                          ),
                          const TextWidget(
                              text: '* Ar conticionado', sizeText: 14),
                          const TextWidget(
                              text: '* Refeição no balcão', sizeText: 14),
                          const TextWidget(
                            text: 'Informações',
                            sizeText: 14,
                            bold: FontWeight.bold,
                          ),
                          TextWidget(
                            text: 'Tel.: +55 ${(restaurant.phone)}',
                            sizeText: 14,
                          ),
                        ],*/
                          ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Horário de funcionamento',
                            sizeText: 18,
                            bold: FontWeight.bold,
                          ),
                          TextWidget(
                            text: 'Segunda - 19:00 á 22:00',
                            sizeText: 14,
                          ),
                          TextWidget(
                            text: 'Terça - 19:00 á 22:00',
                            sizeText: 14,
                          ),
                          TextWidget(
                            text: 'Quarta - 19:00 á 22:00',
                            sizeText: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
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
                        child: TextButton(
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage())),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(Assets.logo),
                          ),
                        ),
                      ),
                       MediaQuery.of(context).size.width >= 590
                          ? DefaultText.normal(
                              'Sabores Cariri',
                            )
                          : const SizedBox(),
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
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            hintText: 'Pesquise por tópicos ou palavras chaves',
                            hintStyle: TextStyle(
                              color: DefaultColors.fontSubTitle,
                            ),
                          ),
                          style: TextStyle(
                            color: DefaultColors.fontTitle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width >= 726 ? 135 : 0,
                    ),
                    IconButton(
                      onPressed: () {},
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
