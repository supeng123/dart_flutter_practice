import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        elevation: 0.0,
      ),
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
        ],
      ),
    );
  }
}