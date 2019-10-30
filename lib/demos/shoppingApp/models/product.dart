import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:flutter/foundation.dart";
import 'package:flutter/material.dart';

class Product extends ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id, 
    @required this.title, 
    @required this.description, 
    @required this.price, 
    @required this.imageUrl, 
    this.isFavorite = false});

  Future<void> toggleFavoriteStatus(String token) async{
    final oldStates = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = 'https://flutter-dart-12d65.firebaseio.com/products/$id.json?auth=$token';
    try {
      final response = await http.patch(url, body: json.encode({
        'isFavorite': isFavorite
      }));
      if (response.statusCode >= 400) {
        isFavorite = oldStates;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStates;
      notifyListeners();
    }
    
  }
}