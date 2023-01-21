import 'dart:convert';

import 'package:bsafe/models/Answer.dart';

class CatQuestion {
  late String id;
  late String quesId;
  late String question;
  late String type;
  late String surveyId;
  late List<Answer> answer;

  CatQuestion(this.id, this.quesId, this.question, this.type, this.answer,
      this.surveyId);

  CatQuestion.fromJson(dynamic data, String catid, bool fromLocal) {
    id = fromLocal ? data['id'] : data['id'] + ":" + catid;
    quesId = fromLocal ? data['quesId'] : data['id'];
    question = data["question"];
    type = data["type"];
    answer = [];
    for (dynamic option in json.decode(data["answer"])) {
      answer.add(Answer.fromJson(option));
    }
    surveyId = catid;
  }
  CatQuestion.hybrid(
      dynamic data, String catid, bool fromLocal, List<Answer> ans) {
    id = fromLocal ? data['id'] : data['id'] + ":" + catid;
    quesId = fromLocal ? data['quesId'] : data['id'];
    question = data["question"];
    type = data["type"];
    surveyId = catid;
    answer = ans;
  }

  Map<String, dynamic> toJson() {
    List<String> options = [];
    for (Answer ans in answer) {
      options.add(json.encode(ans));
    }
    Map<String, dynamic> ret = {
      "id": id,
      "quesId": quesId,
      "question": question,
      "type": type,
      "answer": json.encode(options),
      "surveyId": surveyId,
    };
    return ret;
  }
}
