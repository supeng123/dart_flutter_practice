import 'package:flutter/material.dart';

import '../components/user/Register.dart';
import '../components/user/Login.dart';
import '../components/Tabs.dart';
import '../components/Search.dart';

import '../demos/dartBasic/basicone.dart';
import '../demos/expenseApp/index.dart';
import '../demos/mealApp/index.dart';
import '../demos/shoppingApp/index.dart';

final routes = {
  '/':(context,{arguments}) => Tabs(),
  '/register':(context,{arguments}) => RegisterForm(),
  '/login':(context, {arguments}) => LoginPage(),
  '/basicone': (context, {arguments}) => BasicOnePage(),
  '/expenseApp': (context, {arguments}) => ExpenseAppPage(),
  '/mealApp': (context, {arguments}) => MealAppPage(),
  '/shoppingApp': (context, {arguments}) => ShoppingAppPage(),
  '/search': (context,{arguments}) => SearchPage(arguments:arguments),
};

var onGenerateRoute = (RouteSettings settings){
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    
    if(pageContentBuilder != null){
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
        return route;		 
      
    }else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context));
        return route;
    }
};