import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/User.dart';
import '../models/Location.dart';

class Auth with ChangeNotifier {
  bool _isAuth = false;
  User _user = User();
  final Location _location = Location();

  User get user {
    return _user;
  }

  Location get location{
    return _location;
  }

  bool get auth {
    return _isAuth;
  }

  Future<String> login(String userId, String password) async {
    if (_isAuth) return 'Already Logged in!';
    Map<String, dynamic> body = {
      'userId': userId,
      'password': password,
    };
    var result = await http.post(
      Uri.parse("https://bpac.in/b-safe-constituency/cgi/login.php"),
      body: body,
    );
    var data = jsonDecode(result.body);
    if (data['userId'] == null) {
      return data['message'];
    }
    _user = User.fromJson(data);
    _isAuth = true;
    return "Successfully logged in!";
  }

  Future<List<dynamic>> getLocationList() async {
    var result = await http.get(Uri.parse(
        "https://bpac.in/b-safe-constituency/cgi/location.php"));
    return jsonDecode(result.body);
  }
}
