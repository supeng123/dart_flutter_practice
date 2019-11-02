import 'package:flutter/material.dart';
import 'package:my_first_app/demos/loationApp/screens/add_place_screen.dart';
import 'package:my_first_app/demos/loationApp/screens/places_list_screen.dart';
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
import '../demos/shoppingApp/screens/user_products_screen.dart';
import '../demos/shoppingApp/screens/edit_product_screen.dart';
import '../demos/shoppingApp/screens/auth-screen.dart';

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
  UserProductsScreen.routeName: (context, {arguments}) => UserProductsScreen(),
  EditProductScreen.routeName: (context, {arguments}) => EditProductScreen(arguments),
  AuthScreen.routeName: (context, {arguments}) => AuthScreen(),
  '/places-list': (context, {arguments}) => PlaceListScreen(),
  AddPlacesScreen.routeName: (context, {arguments}) => AddPlacesScreen(),
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