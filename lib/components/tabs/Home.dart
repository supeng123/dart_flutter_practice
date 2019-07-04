import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            cursorColor: Colors.white, //设置光标
              decoration: InputDecoration(
                //输入框decoration属性
                contentPadding: new EdgeInsets.only(left: 0.0),
                fillColor: Colors.black,
                border: InputBorder.none,
                icon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){

                  }),
                hintText: "content",
                hintStyle: new TextStyle(fontSize: 14, color: Colors.white)),
                style: new TextStyle(fontSize: 14, color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.blueGrey,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "hot topic"),
              Tab(text: "recommend")
            ],
          ),
        ),
        body: TabBarView(
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
                  title: Text("second tab")
                ),
              ],
            ),
          ]
        )
    ),);
  }
}

