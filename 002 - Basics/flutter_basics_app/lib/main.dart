import 'package:flutter/material.dart';
import 'package:flutter_basics_app/quiz.dart';
import 'package:flutter_basics_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {"text": "black", "score": 10},
        {"text": "Blue", "score": 5},
        {"text": "Red", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "dog", "score": 7},
        {"text": "cat", "score": 3},
        {"text": "tiger", "score": 10},
        {"text": "bird", "score": 4}
      ],
    },
    {
      "questionText": "who's your favorite instructor?",
      "answer": [
        {"text": "EmJey", "score": 10},
        {"text": "Ali", "score": 7},
        {"text": "Max", "score": 6},
        {"text": "John", "score": 4}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQueston(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQueston: _answerQueston,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
