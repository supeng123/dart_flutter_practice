 import 'package:flutter/material.dart';

 import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
     Product(
      title: 'Red Shirt',
      id: 'p1',
      description: 'A red Shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'
      ),
      Product(
      title: 'Blue Shirt',
      id: 'p2',
      description: 'A red Shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'
      ),
      Product(
      title: 'Yellow Shirt',
      id: 'p3',
      description: 'A red Shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'
      ),
      Product(
      title: 'Black Shirt',
      id: 'p4',
      description: 'A red Shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg'
      ),
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

  void addProduct(value) {
    _items.add(value);
    notifyListeners();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
}

class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}