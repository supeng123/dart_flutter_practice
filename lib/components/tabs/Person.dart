import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PersonPage'),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add, size: 33),
        backgroundColor: Colors.greenAccent
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("search"),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              Navigator.pushNamed(context, '/search', arguments:{"pid":111});
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("log in"),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
                Navigator.pushNamed(context, '/login');
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("dart basic one"),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
                Navigator.pushNamed(context, '/basicone');
            },
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("expenseApp"),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
                Navigator.pushNamed(context, '/expenseApp');
            },
          ),
        ],
      ),
    );
  }
}