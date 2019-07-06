import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with SingleTickerProviderStateMixin {
  TabController contorller;

  Widget appBarTitle = new Text("Search Example", style: new TextStyle(color: Colors.white));
  Icon icon = new Icon(Icons.search, color: Colors.white);

  @override
  void initState() {
    super.initState();
    contorller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        centerTitle: true,
        actions:<Widget>[
          IconButton(
            icon: icon,
            onPressed: (){
              setState(() {
                if(this.icon.icon == Icons.search) {
                  this.icon = new Icon(
                    Icons.close,
                    color: Colors.black,
                  );
                  this.appBarTitle = new TextField(
                    style: new TextStyle(
                      color: Colors.black
                    ),
                    decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.black),
                      hintText: "Search...",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)))
                    ),
                    onChanged: (text){
                      print(text);
                    },
                  );
                } else {
                  setState(() {
                    this.icon = new Icon(
                      Icons.search,
                      color: Colors.white,
                    );
                    this.appBarTitle = new Text(
                      "Search Sample",
                      style: new TextStyle(color: Colors.white),
                    );
                  });
                }
              });
            },
          )
        ],
        bottom: TabBar(
          controller: contorller,
          tabs: <Tab>[
            Tab(text: "book"),
            Tab(text: "movie"),
            Tab(text: "music"),
            Tab(text: "market")
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