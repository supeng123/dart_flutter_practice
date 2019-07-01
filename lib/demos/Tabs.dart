// import 'package:flutter/material.dart';

// class Tabs extends StatefulWidget{
//    Tabs({Key key}): super(key: key);
   
//    _Tabstate createState() => _TabState();
//  }
 
//  class _TabState extends State<Tabs> {
//  	int _currentIndex = 0;
 	
//  	List _pageList = [
//       // HomePage(),
//       // CatePage(),
//       // SettingPage()
//  	]
 
//    @override
//   	Widget build(BuildContext context) {
//       return Scaffold(
//       	appBar: AppBar(
//       		title: Text("title")
//       	),
//       	body: this._pageList[this._currentIndex],
//       	bottomNavigationBar: BottomNavigationBar(
//       		type: BottomNavigationBarType.fixed，//when there are multiple icons
//       		items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icon.category),
//                 title: Text("category")，
//                 currentIndex: this._currentIndex,
//                 onTap: (index){
//                   print(index)
//                   setState() {
//                     this._currentIndex++;
//                   }
//                 }
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icon.category),
//                 title: Text("category")
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icon.category),
//                 title: Text("category")
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.category),
//                 title: Text("category")
//               ),
//             ],
//       	),
//         drawer: Drawer(
//           child: Column(
//             children: <Widget>[
//               Expanded(child: UserAccountsDrawerHeader(
//                 accountName: Text("slogan"),
//                 accountEmail: Text("email"),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: NetworkImage("url")
//                 ),
//               )
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(child: Icon(Icons.home)),
//                   title: Text("my space"),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     Navigator.pushNamed(context, '/my space');
//                   }
//                 )
//             ]
//           ),
//         ),
//         endDrawer: Drawer(
//           child: Text("right tabBar"),
//         ),
//       );
//   	}
//  }
