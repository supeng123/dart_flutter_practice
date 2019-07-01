import 'package:flutter/material.dart';

import 'tabs/Book.dart';
import 'tabs/Person.dart';
import 'tabs/Group.dart';
import 'tabs/Home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 1;
  var appBarTitles = ['首页', '书影音', '小组', '我的'];
  List _pageList = [
    HomePage(),
    BookPage(),
    GroupPage(),
    PersonPage()
  ];

  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index){
            setState(() {
               this._currentIndex = index;           
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              title: getTabTitle(0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books, color: Colors.grey),
              title: getTabTitle(1)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.grey),
              title: getTabTitle(2)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              title: getTabTitle(3)
            )
          ],
          )
      );
  }
}
