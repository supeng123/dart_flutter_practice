import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

class MealAppPage extends StatefulWidget {
  @override
  _MealAppPageState createState() => _MealAppPageState();
}

class _MealAppPageState extends State<MealAppPage> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'DetailMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway'
      ),
      home: CategoryScreenPage(),
      // initialRoute: '/index',
      routes: {
        // '/index': (ctx) => CategoryScreenPage(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
      },
    );
         
  }
}
