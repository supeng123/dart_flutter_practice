import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Column(children: transactions.map((tx) {
            return Card(child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical:10, horizontal: 15),
                decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(tx.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(DateFormat('yyyy-MM-dd').format(tx.date), style: TextStyle(color: Colors.grey),)
                ],)
            ],),);
          }).toList());
  }
}