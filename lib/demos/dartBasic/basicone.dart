import 'package:flutter/material.dart';
class BasicOnePage extends StatefulWidget {
  @override
  _BasicOnePageState createState() => _BasicOnePageState();
}

class _BasicOnePageState extends State<BasicOnePage> {
  var questionIndex = 0;

  void answerQuestion() {
    print('about to change state');
    setState(() {
      this.questionIndex = this.questionIndex + 1;
      print(questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      'what\'s your favorite color', 
      'what\'s your favorite animals'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicOnePage'),
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        Text('the question'),
        RaisedButton(child: Text(questions.elementAt(1)), onPressed: answerQuestion,),
        RaisedButton(child: Text(questions[0]), onPressed: answerQuestion,),
        RaisedButton(child: Text('question'), onPressed: answerQuestion,),
      ],)
    );
  }
}