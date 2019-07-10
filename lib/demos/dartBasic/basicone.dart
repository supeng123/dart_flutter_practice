import 'package:flutter/material.dart';

import './quiz.dart';

class BasicOnePage extends StatefulWidget {
  @override
  _BasicOnePageState createState() => _BasicOnePageState();
}

class _BasicOnePageState extends State<BasicOnePage> {
  static const _questions = [
      {
        'questionText':'what\'s your favorite color',
        'answers':[{'text':'Black', 'score': 1}, {'text':'Red', 'score': 2}, {'text':'Green', 'score': 3}, {'text':'White', 'score': 4}] 
      },
      {
        'questionText':'what\'s your favorite animals',
        'answers':[{'text':'Cat', 'score': 2}, {'text':'Dog', 'score': 3}, {'text':'Snaker','score':55}]
      }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {

    setState(() {
      _totalScore += score;
      this._questionIndex = this._questionIndex + 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicOnePage'),
        elevation: 0.0,
      ),
      body: _questionIndex < _questions.length ? 
      QuizPage(
      questions: _questions, 
      questionIndex: _questionIndex, 
      answerQuestion: _answerQuestion,) : 
      Center(child: Text('${_totalScore}')),
    );
  }
}