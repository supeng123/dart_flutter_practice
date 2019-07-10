import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String questionText;

  QuestionPage(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top:20),
      child: Text(
        this.questionText,
        style: TextStyle(
          fontSize: 28
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}