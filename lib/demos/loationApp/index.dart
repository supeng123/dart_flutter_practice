import 'package:flutter/material.dart';
import './screens/places_list_screen.dart';

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
      body: PlaceListScreen(),
    );
  }
}