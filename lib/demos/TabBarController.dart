
import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 2 
    );

    _tabController.addListener(() {
      print(_tabController.index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarControllerPage'),
        elevation: 0.0,
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: "hostest"),
            Tab(text: "latest",)
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Text("supeng"),
          Text("sugang")
        ],
      ),
    );
  }
}