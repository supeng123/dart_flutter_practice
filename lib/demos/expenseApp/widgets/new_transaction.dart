import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState(addTx: this.addTx);
}

class _NewTransactionState extends State<NewTransaction> {
  final Function addTx;
  _NewTransactionState({this.addTx});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//does not work when switch to other textField
// class NewTransaction extends StatelessWidget {
//   final Function addTx;
//   final titleController = TextEditingController();
//   final amountController = TextEditingController();

//   NewTransaction(this.addTx);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(labelText: 'Title'),
//               controller: titleController
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Amount'),
//               controller: amountController
//             ),
//             FlatButton(
//               child: Text('Add Transaction'),
//               textColor: Colors.purple,
//               onPressed: () {
//                 addTx(
//                   titleController.text,
//                   double.parse(amountController.text),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
