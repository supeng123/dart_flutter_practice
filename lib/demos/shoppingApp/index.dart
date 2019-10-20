import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';

// class ShoppingAppPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ShoppingApp'),
//         elevation: 0.0,
//       ),
//       body: ProductsOverviewScreen(),
//     );
//   }
// }
class ShoppingAppPage extends StatefulWidget {
  @override
  _ShoppingAppPageState createState() => _ShoppingAppPageState();
}

class _ShoppingAppPageState extends State<ShoppingAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingAppPage'),
        elevation: 0.0,
      ),
      
      body: ProductsOverviewScreen(),
    );
  }
}