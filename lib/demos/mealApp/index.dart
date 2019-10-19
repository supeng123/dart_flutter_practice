import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import './dummy_data.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

class MealAppPage extends StatefulWidget {
  @override
  _MealAppPageState createState() => _MealAppPageState();
}

class _MealAppPageState extends State<MealAppPage> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
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
