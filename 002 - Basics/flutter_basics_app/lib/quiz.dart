import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQueston;

  Quiz({
    required this.questions,
    required this.answerQueston,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]["questionText"] as String,
        ),
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerQueston(answer["score"]),
            answer["text"] as String,
          );
        }).toList()
      ],
    );
  }
}
