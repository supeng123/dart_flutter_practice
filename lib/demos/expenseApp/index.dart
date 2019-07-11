import 'package:flutter/material.dart';

import 'widgets/user_transaction.dart';

class ExpenseAppPage extends StatefulWidget {
  @override
  _ExpenseAppPageState createState() => _ExpenseAppPageState();
}

class _ExpenseAppPageState extends State<ExpenseAppPage> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpenseAppPage'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.blue,
                  child: Container(
                    width: double.infinity,
                    child: Text('one')
                    ),
                  elevation: 5,
                  ),
                UserTransaction()
            ] ,
            ),
      ),
    );
  }
}