import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  Map arguments;
  SearchPage({Key key, this.arguments}): super(key:key);

  @override
  _SearchPageState createState() => _SearchPageState(arguments: this.arguments);
}

class _SearchPageState extends State<SearchPage> {
  Map arguments;

  _SearchPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchPage'),
        elevation: 0.0,
      ),
      body: Container(
            child: Text("pid=${arguments["pid"]}")
          ),
    );
  }
}