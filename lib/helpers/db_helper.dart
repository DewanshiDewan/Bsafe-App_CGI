import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
import '../models/User.dart';
import '../models/Location.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'bsafe10.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE categories(id TEXT PRIMARY KEY, categoryname TEXT)');
            
        db.execute(
          'CREATE TABLE savedquestions(id TEXT PRIMARY KEY, quesId TEXT, question TEXT, type TEXT, answer TEXT, surveyId TEXT)'
        );

        // db.execute(
        //     'CREATE TABLE users(username TEXT PRIMARY KEY, password TEXT)');
        // User user1 = User(username: "super", password: "123");
        // User user2 = User(username: "root", password: "567");
        // addUser(user1, db);
        // addUser(user2, db);

        db.execute(
            'CREATE TABLE locations(id TEXT PRIMARY KEY, location_name TEXT)');
      },
      version: 2,
    );
  }

  static Future<void> addUser(User user, Database db) async {
    final data = user.toJson();
    db.insert(
      'users',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('added user');
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> updateData(
      String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [data["id"]],
    );
  }

  static Future<void> deleteData(String table, String id) async {
    final db = await DBHelper.database();
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
