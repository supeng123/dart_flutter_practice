import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState(addTx: this.addTx);
}

class _NewTransactionState extends State<NewTransaction> {
  final Function addTx;
  _NewTransactionState({this.addTx});

  DateTime _selectedDate;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    
    });
  }

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
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null ?'No Date Choosen' : DateFormat.yMd().format(_selectedDate))),
                  FlatButton(
                    child: Text('Choose date', style: TextStyle(fontWeight: FontWeight.bold),),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,)
              ],),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              textColor: Colors.black,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                  _selectedDate
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
