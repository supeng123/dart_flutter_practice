import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class QuizPage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  QuizPage({@required this.questions, @required this.questionIndex, @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        QuestionPage(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return AnswerPage(answer['text'], () => answerQuestion(answer['score']));
        }).toList()
      ]);
  }
}

