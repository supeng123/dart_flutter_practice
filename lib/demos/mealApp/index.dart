import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

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
      home: TabsScreen(),
      // initialRoute: '/index',
      routes: {
        // '/index': (ctx) => CategoryScreenPage(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen()
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      // },
      onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());//404page
      },
    );
         
  }
}
