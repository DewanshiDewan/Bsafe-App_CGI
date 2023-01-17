import 'package:bsafe/models/Category.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

import '../helpers/db_helper.dart';



Future<List<dynamic>> fetchCategories() async {
  var result = await http.get(Uri.parse(
      "https://bpac.in/b-safe-constituency/cgi/getQuestionsCategory.php"));
  return jsonDecode(result.body);
}

Future<List<dynamic>> fetchCategoriesLocal() async {
  return DBHelper.getData('categories');
}

Future<void> setCategories(List<dynamic> categories) async {
  final db = await DBHelper.database();
  for (Map<String, dynamic> category in categories) {
    Category cat = Category.fromJson(category);
    db.insert(
      'categories',
      cat.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
