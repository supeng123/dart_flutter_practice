import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  
  @override
  Widget build(BuildContext context) {
    return 
      //need parent set the height and width, otherwise the listView will be infinite
      ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30, 
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}')),
                ),  
              ),
              title: Text(
                transactions[index].title, 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold)
              ),
              subtitle: Text(
                DateFormat('yyyy-MM-dd').format(transactions[index].date), 
                style: TextStyle(color: Colors.grey)
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  deleteTx(transactions[index].id);
                },
                ),
            ),
          );
        },
        itemCount: transactions.length,
  );}
}

//replace card with ListTile
// Card(child: Row(children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.symmetric(vertical:10, horizontal: 15),
//                   decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
//                   child: Text(
//                     '\$${transactions[index].amount}',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: <Widget>[
//                     Text(transactions[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                     Text(DateFormat('yyyy-MM-dd').format(transactions[index].date), style: TextStyle(color: Colors.grey),)
//                   ],)
//               ],),)