import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        title: 'Red Shirt',
        id: 'p1',
        description: 'A red Shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'),
    Product(
        title: 'Blue Shirt',
        id: 'p2',
        description: 'A red Shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'),
    Product(
        title: 'Yellow Shirt',
        id: 'p3',
        description: 'A red Shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'),
    Product(
        title: 'Black Shirt',
        id: 'p4',
        description: 'A red Shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    const url = 'https://flutter-update.firebaseio.com/products.json';
    http.post(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'isFavorite': product.isFavorite
    })).then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
        id: json.decode(response.body)['name']);
      _items.add(newProduct);
      notifyListeners();

    });
  }

  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((prod)=> prod.id == id);
    if (productIndex >=0 ){
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
    
  }

  void delteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}

class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}
