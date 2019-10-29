
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Auth();

  Future<void> signup(String email, String password) async {
    const url = 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyCL456EJrzHDvU8ANhsgx4lfnoOTgx23Aw';

    try {
      final response = await http.post(url, body: json.encode({
        'email': email, 'password': password, 'returnSecureToken': true
      }));
    } catch (err) {

    }
  }

}