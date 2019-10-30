import 'package:flutter/material.dart';

import 'routes/Routes.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import './demos/shoppingApp/providers/products.dart';
import './demos/shoppingApp/providers/cart.dart';
import './demos/shoppingApp/providers/orders.dart';
import './demos//shoppingApp/providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          builder: (ctx, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    title:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            // fontFamily: 'Trajan Pro'
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: auth.isAuth ? '/shoppingApp' : '/',
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}

//command + > zidongbuquan
