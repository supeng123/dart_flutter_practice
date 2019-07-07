import 'package:flutter/material.dart';

import '../components/user/Register.dart';
import '../components/user/Login.dart';
import '../components/Tabs.dart';
import '../components/Search.dart';

final routes = {
  '/':(context,{arguments}) => Tabs(),
  '/register':(context,{arguments}) => RegisterForm(),
  '/login':(context, {arguments}) => LoginPage(),
  '/search': (context,{arguments}) => SearchPage(arguments:arguments)
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