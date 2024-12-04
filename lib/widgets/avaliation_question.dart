import 'package:flutter/material.dart';
import 'package:gastro_experience/models/question.dart';
import 'package:gastro_experience/widgets/stars.dart';
import 'package:gastro_experience/widgets/text.dart';

class AvaliationQuestionController extends ChangeNotifier {
  int rating = 0;

  setRating(int newRating){
    rating = newRating;
    notifyListeners();
  }
}

class AvaliationQuestion extends StatefulWidget {
  final Question question;
  final Function(Question, int) onRate;

  const AvaliationQuestion({
    super.key,
    required this.question,
    required this.onRate
  });

  @override
  State<AvaliationQuestion> createState() => _AvaliationQuestionState();
}

class _AvaliationQuestionState extends State<AvaliationQuestion> {
  final AvaliationQuestionController controller = AvaliationQuestionController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DefaultText.normal(widget.question.question),
        ),
        ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return StarsIcon(
              alignment: MainAxisAlignment.center,
              rating: controller.rating,
              onClick: (newRating){
                if (newRating == controller.rating) newRating = 0;
                widget.onRate(widget.question, newRating);
                controller.setRating(newRating);
              },
              isInteractive: true,
              scale: 3,
            );
          }
        )
      ],
    );
  }
}