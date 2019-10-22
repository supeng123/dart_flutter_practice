

import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List <CartItem> products;
  final DateTime dataTime;

  OrderItem({@required this.id, @required this.amount, @required this.products, @required this.dataTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders= [];
  List<OrderItem> get orders {
    return [..._orders];
  }
}