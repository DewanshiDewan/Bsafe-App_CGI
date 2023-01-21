import 'package:bsafe/models/Location.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

import '../helpers/db_helper.dart';



Future<List<dynamic>> getLocationList() async {
  var result = await http.get(Uri.parse(
      "https://bpac.in/b-safe-constituency/cgi/location.php"));
  return jsonDecode(result.body);
}

Future<List<dynamic>> getLocationsLocal() async {
  return DBHelper.getData('locations');
}

Future<void> setLocations(List<dynamic> locations) async {
  final db = await DBHelper.database();
  for (Map<String, dynamic> location in locations) {
    Location cat = Location.fromJson(location);
    db.insert(
      'locations',
      cat.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
