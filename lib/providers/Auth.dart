import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';
import '../helpers/db_helper.dart';

class Auth with ChangeNotifier {
  String? _user;
  bool isAuth = false;
  List<User> _users = [];
  bool pinMode = false;

  String get user {
    if (_user == null) {
      return "";
    }
    return _user!;
  }

  Auth() {
    fetchAndSetData();
    checkMode();
  }

  Future<void> setPin(int pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("userpin", pin);
    await prefs.setBool("userpinthere", true);
  }

  Future<bool> loginPin(int pin) async {
    final prefs = await SharedPreferences.getInstance();
    final int? userpin = prefs.getInt("userpin");
    return userpin == pin;
  }

  Future<bool> checkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("userpinthere")!;
  }

  Future<void> addUser(User user) async {
    final data = user.toJson();
    final resp = await DBHelper.insert('users', data);
    print('added user');
  }

  Future<void> fetchAndSetData() async {
    final userlist = await DBHelper.getData('users');
    _users = userlist.map((e) => User.fromJson(e)).toList();
    notifyListeners();
  }

  bool loginUser(String username, String password) {
    for (User user in _users) {
      if (user.username == username && user.password == password) {
        _user = username;
        isAuth = true;
        return true;
      }
    }
    return false;
  }

  Future<void> logout() async{
    isAuth = false;
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("userpinthere", false);
  }
}
