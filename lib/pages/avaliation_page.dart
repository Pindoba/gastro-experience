import 'package:flutter/material.dart';
import 'package:gastro_experience/controller/avaliation_page_controller.dart';
import 'package:gastro_experience/models/question.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/widgets/avaliation_question.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text.dart';
import 'package:provider/provider.dart';

class AvaliationPage extends StatefulWidget {
  final Restaurant restaurant;
  const AvaliationPage({super.key, required this.restaurant});

  @override
  State<AvaliationPage> createState() => _AvaliationPageState();
}

class _AvaliationPageState extends State<AvaliationPage> {
  late final AvaliationPageController controller;
  final int _crossAxisCount = 4;
  final double _aspectRatio = 8 / 2;

  @override
  void initState() {
    super.initState();
    controller = AvaliationPageController(
      widget.restaurant,
      context.read()
    );

    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          double screenWidth = MediaQuery.of(context).size.width;
          double gridWidth = (screenWidth - ((_crossAxisCount - 1) * 250)) / _crossAxisCount;
          double gridHeight = gridWidth / _aspectRatio;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultText.h1("Avaliação do estabelecimento"),
                DefaultText.h2(controller.restaurant.name),
            
                if (controller.isLoading) const CircularProgressIndicator()
                else ...[
                  Flexible(
                    child: GridView.builder(
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: _aspectRatio,
                        mainAxisExtent: gridHeight
                      ),
                      itemCount: controller.questions.length,
                      itemBuilder: (_, i){
                        Question question = controller.questions[i].question;
              
                        return AvaliationQuestion(question: question, onRate: controller.setQuestionRate);
                      }
                    ),
                  ),
                  if (controller.canAvaliate)
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultButton(
                            onPressed: () => controller.createAvaliation(context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 64.0),
                              child: DefaultText.normal("Avaliar"),
                            )
                          ),
                        ],
                      ),
                    ),
                ]
              ],
            ),
          );
        }
      )
    );
  }
}