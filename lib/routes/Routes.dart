import 'package:flutter/material.dart';

// final routes = {
//   '/':(context) => Tabs(),
//   '/form':(context) => Tabs(),
//   '/search':(context,{arguments})=> Tabs() 
// }

// var onGenerateRoute = (RouteSettings settings){
//     final String name = settings.name;
//     final Function pageContentBuilder = routes[name];
    
//     if(pageContentBuilder != null){
//       final Route route = MaterialPageRoute(
//         builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
//         return route;		 
      
//     }else {
//       final Route route = MaterialPageRoute(
//         builder: (context)=>pageContentBuilder(context);
//         return route;
//       );
//     }
// };