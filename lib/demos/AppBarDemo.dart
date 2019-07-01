import 'package:flutter/material.dart';

class WidgetName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('menu');
            },
          ),
          backgroundColor: Colors.red,
          title: Text('WidgetName'),//
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print('search');
              },
              icon: Icon(Icons.search),
            )
          ],
          elevation: 0.0,
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'hotest'),
            Tab(text: 'latest',)
          ],),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(title:Text('first tab')),
                ListTile(title:Text('first tab')),
                ListTile(title:Text('first tab')),
              ]
            ),
            ListView(
              children: <Widget>[
                ListTile(title:Text('second tab')),
                ListTile(title:Text('second tab')),
                ListTile(title:Text('second tab')),
              ]
            )
          ]
        ),
    ));
  }
}


//将appbar里面的title换成tabbar，可以将顶部导航替换原来的title
//写法如下 包bottom 换掉
// title: Row(
//   children: <Widget>[
//     Expand(
//       child: TabBar(
//             isScrollable: true,
//             tabs: <Widget>[
//               Tab(text: 'hotest'),
//               Tab(text: 'latest',)
//             ],
//     )
//   ]
// )