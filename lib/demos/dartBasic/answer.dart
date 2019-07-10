import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final String text;
  final Function selectHandler;
  AnswerPage(this.text, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.text),
        onPressed: selectHandler
      ),
    );
  }
}