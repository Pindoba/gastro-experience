import 'package:flutter/material.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/text_widget.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurants restaurant;

  const CardRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Cores.primary,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            SizedBox(
              height: 150,
              width: 280,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                child: Image.network(
                  restaurant.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
              child: Container(
                height: 40,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.safety_check_rounded, color: Cores.like),
                    Row(
                      children: [
                        Container(
                        width: 30, // largura do container
                        height: 30, // altura do container
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // forma circular
                          border: Border.all( // borda
                            color: Colors.yellow, // cor da borda
                            width: 1, // largura da borda
                          ),
                        ),
                        child: 
                        
                        Icon(Icons.share, color: Cores.like,size: 16,),),
                        SizedBox(width: 10),
                        Container(
                          width: 30, // largura do container
                          height: 30, // altura do container
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // forma circular
                            border: Border.all(
                              // borda
                              color: Colors.yellow, // cor da borda
                              width: 1, // largura da borda
                            ),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Cores.like,
                            size: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: restaurant.name,
                        color: Cores.fontTitle,
                        sizeText: 20,
                        bold: FontWeight.bold),
                  ],
                ),
                TextWidget(
                  text: restaurant.address.street,
                  color: Cores.fontSubTitle,
                  sizeText: 16,
                ),
                Row(
                  children: [
                    // SizedBox(
                    //   width: 214,
                    //   child: TextWidget(text: restaurant.description, color: Cores.fontSubTitle, sizeText: 16,overflow: TextOverflow.ellipsis, maxLines: 1, )),
                  ],
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.restaurant_menu,
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
                        (index) => index < 3
                            ? Icon(
                                Icons.attach_money_outlined,
                                color: Cores.fontSubTitle,
                                size: 16,
                              )
                            : SizedBox(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
