import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';
import './transaction.dart';

class ExpenseAppPage extends StatefulWidget {
  @override
  _ExpenseAppPageState createState() => _ExpenseAppPageState();
}

class _ExpenseAppPageState extends State<ExpenseAppPage> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bCtx){
      return GestureDetector(
        child: NewTransaction(_addNewTransaction),
        onTap: () {},
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpenseAppPage'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed: () => _startAddNewTransaction(context))
        ],
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
                // UserTransactions()
                TransactionList(_userTransactions)
            ] ,
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        )
    );
  }
}
