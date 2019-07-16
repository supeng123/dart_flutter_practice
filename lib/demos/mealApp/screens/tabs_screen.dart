import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  Widget getDefaultTabBar() {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabsScreen'),
          elevation: 0.0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Stars',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoryScreenPage(), 
          FavoritesScreen()
        ],),
      ),
    );
  }

  final List<Map<String, Object>> _pages = [
    {'page': CategoryScreenPage(), 'title': 'Category'},
    {'page': FavoritesScreen(), 'title': 'Favorites'}
  ];

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  int _selectPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories')
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites')
          ),
        ],
      ),
    );
  }
}
