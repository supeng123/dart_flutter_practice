import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with SingleTickerProviderStateMixin {
  TabController contorller;
  @override
  void initState() {
    super.initState();
    contorller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: contorller,
          tabs: <Tab>[
            Tab(text: "hot topic"),
            Tab(text: "recommend"),
            Tab(text: "movie"),
            Tab(text: "music")
          ]
        ),
        
      ),
      body: TabBarView(
        controller: contorller,
        children: <Widget>[
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("first tab")
            ),
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("fourth tab")
            ),
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("second tab")
            ),
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("third tab")
            ),
          ],
        ),
        
      ],),
    );
    
  }
}