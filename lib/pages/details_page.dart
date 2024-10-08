import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/widgets/text_widget.dart';
import 'package:gastro_experience/style.dart';
import 'package:hovering/hovering.dart';

class DetailsPage extends StatefulWidget {
  final Restaurants restaurant;
  const DetailsPage({super.key, required this.restaurant});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ScrollController _scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
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
                  widget.restaurant.mainImage,
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
                                children: [
                                  TextWidget(
                                    text: widget.restaurant.name,
                                    sizeText: 32,
                                    bold: FontWeight.w500,
                                    color: Cores.primary,
                                  ),
                                  widget.restaurant.stamp == true
                                      ? const Icon(
                                          Icons.workspace_premium_outlined)
                                      : const SizedBox(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color:
                                            widget.restaurant.isFavorite == true
                                                ? Colors.red
                                                : Cores.fontSubTitle,
                                      ))
                                ],
                              ),
                              //estrelas aqui
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: index < 3 ? Cores.like : Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      5,
                                      (index) =>
                                          index < widget.restaurant.priceRange
                                              ? Icon(
                                                  Icons.attach_money_outlined,
                                                  color: Cores.fontSubTitle,
                                                  size: 16,
                                                )
                                              : const SizedBox(),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: TextWidget(
                                        text: ' - italiana',
                                        color: Cores.fontSubTitle,
                                        sizeText: 14,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        alignment: TextAlign.start,
                                      )),
                                ],
                              ),
                            ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: widget.restaurant.address.street,
                                  sizeText: 16,
                                  color: Cores.fontSubTitle,
                                  alignment: TextAlign.left,
                                ),
                                TextWidget(
                                    text:
                                        ' nº ${(widget.restaurant.address.number)}',
                                    sizeText: 16,
                                    color: Cores.fontSubTitle,
                                    alignment: TextAlign.left),
                              ],
                            ),
                            TextWidget(
                                text:
                                    'Bairro: ${(widget.restaurant.address.neighborhood)}',
                                sizeText: 16,
                                color: Cores.fontSubTitle,
                                alignment: TextAlign.left),
                            TextWidget(
                                text: widget.restaurant.address.city,
                                sizeText: 16,
                                color: Cores.fontSubTitle,
                                alignment: TextAlign.left),
                          ],
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
                          text: widget.restaurant.description,
                          color: Cores.fontTitle,
                          sizeText: 16,
                          alignment: TextAlign.justify),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
        
              Column(crossAxisAlignment: CrossAxisAlignment.center,
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
                            color: Cores.fontTitle,
                            sizeText: 18,
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.arrow_back_ios, size: 15),
                                onPressed: () {
                                  _scrollController2.animateTo(
                                    _scrollController2.offset - 280,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 15),
                                onPressed: () {
                                  _scrollController2.animateTo(
                                    _scrollController2.offset + 280,
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
                                controller: _scrollController2,
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
                                              widget.restaurant.mainImage)),
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
                        children: [
                          const TextWidget(
                            text: 'Instalações e Serviços',
                            sizeText: 18,
                            bold: FontWeight.bold,
                          ),
                          const TextWidget(text: '* Ar conticionado', sizeText: 14),
                          const TextWidget(text: '* Refeição no balcão', sizeText: 14),
                          const TextWidget(text: 'Informações', sizeText: 14, bold: FontWeight.bold,),
                          TextWidget(text: 'Tel.: +55 ${(widget.restaurant.phoneNumber)}', sizeText: 14),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: 'Horário de funcionamento',
                              sizeText: 18,
                              bold: FontWeight.bold),
                          TextWidget(text: 'Segunda - 19:00 á 22:00', sizeText: 14),
                          TextWidget(text: 'Terça - 19:00 á 22:00', sizeText: 14),
                          TextWidget(text: 'Quarta - 19:00 á 22:00', sizeText: 14),
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
                        child: CircleAvatar(
                          child: Image.network(
                            'https://png.pngtree.com/png-clipart/20230624/original/pngtree-cooking-logo-vector-png-image_9213639.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      MediaQuery.of(context).size.width >= 590
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
                          controller: TextEditingController(),
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
                      width: MediaQuery.of(context).size.width >= 726 ? 135 : 0,
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
