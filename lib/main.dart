import 'package:flutter/material.dart';
import 'components/Tabs.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes:{
      //   '/': (context) => RxDartDemo(),
      // },
      home: Tabs()
    );
  }
}

//command + > zidongbuquan
