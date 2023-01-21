import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/CatQuestion.dart';
import '../helpers/db_helper.dart';

Future<List<dynamic>> fetchQuestions(String category) async {
  Map<String, dynamic> body = {
    'category': category,
    'version': "1",
  };
  var result = await http.post(
    Uri.parse(
        "https://bpac.in/b-safe-constituency/cgi/getQuestionsbyCategory.php"),
    body: body,
  );
  return jsonDecode(result.body);
}

Future<void> setQuestions(List<dynamic> questions, String catId) async {
  final db = await DBHelper.database();
  for (Map<String, dynamic> question in questions) {
    CatQuestion ques = CatQuestion.fromJson(question, catId, false);
    db.insert(
      'questions',
      ques.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> saveQuestions(List<CatQuestion> questions) async {
  final db = await DBHelper.database();
  for (CatQuestion question in questions) {
    db.insert(
      'savedquestions',
      question.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> updateQuestion(CatQuestion ques) async {
  DBHelper.updateData('questions', ques.toJson());
}

Future<List<dynamic>> fetchQuestionsLocal(String catid) async {
  final db = await DBHelper.database();
  return db.query('questions', where: "categoryId = $catid");
}

Future<List<dynamic>> fetchQuestionsSaved(String surveyId) async {
  final db = await DBHelper.database();
  return db.query('savedquestions', where: "surveyId = $surveyId");
}

class CatQuestions with ChangeNotifier {}
