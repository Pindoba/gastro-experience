import 'package:flutter/material.dart';
import 'package:gastro_experience/models/avaliation.dart';
import 'package:gastro_experience/models/question.dart';
import 'package:gastro_experience/models/restaurants.dart';
import 'package:gastro_experience/repository/avaliation_repository.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text.dart';

class QuestionWithRate {
  final Question question;
  int rate = 0;

  QuestionWithRate({required this.question});

  @override
  String toString() {
    return "QuestionWithRate(rate: $rate, question: $question)";
  }
}

class AvaliationPageController extends ChangeNotifier {
  final Restaurant restaurant;
  final AvaliationRepository _repository = AvaliationRepository();
  List<QuestionWithRate> questions = [];
  bool isLoading = true;
  bool isLoadingAvaliation = false;
  bool hasSuccessCreating = false;
  bool canAvaliate = false;

  AvaliationPageController(this.restaurant);

  setQuestionRate(Question question, int rate) {
    QuestionWithRate questionToUpdate = questions.firstWhere((q) => q.question == question, orElse:  () => questions.first);

    questionToUpdate.rate = rate;
    canAvaliate = questions.any((e) => e.rate > 0);
    notifyListeners();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();

    await Future.wait([
      loadQuestions(),
    ]);

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadQuestions() async {
    try {
      questions = (await _repository.getQuestions()).map((e) => QuestionWithRate(question: e)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createAvaliation(BuildContext context) async {
    isLoadingAvaliation = true;
    notifyListeners();

    showDialog(
      context: context, 
      builder: (context) =>
        ListenableBuilder(
          listenable: this,
          builder: (context, _) {
            if (isLoadingAvaliation){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (hasSuccessCreating){
              return AlertDialog(
                backgroundColor: DefaultColors.mainBg,
                content: DefaultText.normal("Sua avaliação foi criada. Muito obrigado!"),
                actions: [
                  DefaultButton(
                    onPressed: (){
                      var nav = Navigator.of(context);
                      nav.pop();
                      nav.pop();
                    },
                    child: DefaultText.normal("Voltar")
                  )
                ],
              );
            }

            return AlertDialog(
              backgroundColor: DefaultColors.mainBg,
              content: DefaultText.normal("Ocorreu um erro!"),
              actions: [
                DefaultButton(
                  onPressed: (){
                    var nav = Navigator.of(context);
                    nav.pop();
                    nav.pop();
                  },
                  child: DefaultText.normal("Voltar")
                )
              ],
            );
          }
        )
    );

    Avaliation avaliation = Avaliation(
      restaurantId: restaurant.id!,
      description: "",
      answers: questions
        .where((e) => e.rate > 0)
        .map((e) => Answers(questionId: e.question.id, rating: e.rate))
        .toList()
    );

    try {
      hasSuccessCreating = await _repository.createAvaliation(avaliation);
    } catch (e) {
      hasSuccessCreating = false;
    }

    isLoadingAvaliation = false;
    notifyListeners();
  }
}