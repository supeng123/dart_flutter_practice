import 'package:flutter/material.dart';
import 'package:my_first_app/demos/shoppingApp/providers/orders.dart';
import 'package:my_first_app/demos/shoppingApp/screens/order_screen.dart' as prefix0;

import '../components/user/Register.dart';
import '../components/user/Login.dart';
import '../components/Tabs.dart';
import '../components/Search.dart';

import '../demos/dartBasic/basicone.dart';
import '../demos/expenseApp/index.dart';
import '../demos/mealApp/index.dart';

import '../demos/shoppingApp/index.dart';
import '../demos/shoppingApp/screens/products_detail_screen.dart';
import '../demos/shoppingApp/screens/cart_screen.dart';
import '../demos/shoppingApp/screens/order_screen.dart';

final routes = {
  '/':(context,{arguments}) => Tabs(),
  '/register':(context,{arguments}) => RegisterForm(),
  '/login':(context, {arguments}) => LoginPage(),
  '/basicone': (context, {arguments}) => BasicOnePage(),
  '/expenseApp': (context, {arguments}) => ExpenseAppPage(),
  '/mealApp': (context, {arguments}) => MealAppPage(),
  '/shoppingApp': (context, {arguments}) => ShoppingAppPage(),
  '/search': (context,{arguments}) => SearchPage(arguments:arguments),
  ProductDetailScreen.routeName: (context,{arguments}) => ProductDetailScreen(arguments),
  CartScreen.routeName: (context,{arguments}) => CartScreen(),
  OrdersScreen.routeName: (context,{arguments}) => OrdersScreen(),
};

var onGenerateRoute = (RouteSettings settings){
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    
    if(pageContentBuilder != null){
      print(settings.arguments);
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
        return route;		 
      
    }else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context));
        return route;
    }
};