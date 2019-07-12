import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //need parent set the height and width, otherwise the listView will be infinite
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10, horizontal: 15),
                  decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(transactions[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(DateFormat('yyyy-MM-dd').format(transactions[index].date), style: TextStyle(color: Colors.grey),)
                  ],)
              ],),);
        },
        itemCount: transactions.length,
    )
  );}
}

