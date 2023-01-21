import 'package:bsafe/widgets/Success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/CatQuestion.dart';
import '../providers/CatQuestions.dart';
import '../providers/Auth.dart';
import '../providers/Category.dart';

import '../models/Answer.dart';

import 'textQuestion.dart';
import 'radioQuestion.dart';
import 'dropdownQuestion.dart';
import 'checkQuestion.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class CategoryQuestionnaire extends StatefulWidget {
  final String image;
  final String catid;
  final String fetchMode;
  CategoryQuestionnaire(this.image, this.catid, this.fetchMode);
  @override
  State<CategoryQuestionnaire> createState() => _CategoryQuestionnaireState();
}

class _CategoryQuestionnaireState extends State<CategoryQuestionnaire> {
  late Future<List<dynamic>> questions;
  bool isOnline = true;

  Future<bool> connectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<List<dynamic>> getQuestions() async {
    // final isConnected = await connectivity();
    if (widget.fetchMode == "saved") {
      return fetchQuestionsSaved(widget.catid);
    } else {
      return fetchQuestions(widget.catid);
    }
  }

  @override
  void initState() {
    questions = getQuestions();
    super.initState();
  }

  void showSuccess() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return Success();
        }));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool saved = widget.fetchMode == "saved";
    return FutureBuilder(
      future: questions,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 30,
            ),
            child: Column(children: const [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            ]),
          );
        }
        Map<String, CatQuestion> questions = {};
        List<Widget> questionwidgets = [];
        for (dynamic item in snapshot.data) {
          //parsing the options
          List<Answer> optionList = [];
          for (dynamic opt in json.decode(item["answer"])) {
            dynamic option = saved ? json.decode(opt) : opt;
            optionList.add(
              Answer(
                option["answer"].toString(),
                saved
                    ? option["isActive"]
                    : option["isActive"].toString() == "1"
                        ? true
                        : false,
                option["weightage"].toString(),
                option['image'].toString(),
              ),
            );
          }
          //CatQuestion object created
          CatQuestion newQuestion = CatQuestion.hybrid(
              item, widget.catid, widget.fetchMode == "saved", optionList);
          questions[newQuestion.id] = newQuestion;

          //radio question
          if (item["type"] == "radio") {
            questionwidgets.add(
              RadioQuestion(
                item["question"],
                optionList,
                (String value) {
                  for (Answer option in questions[newQuestion.id]!.answer) {
                    option.isActive = false;
                  }
                  for (Answer option in questions[newQuestion.id]!.answer) {
                    if (option.answer == value) {
                      option.isActive = true;
                      break;
                    }
                  }
                },
              ),
            );
          }
          //check question
          else if (item["type"] == "radio") {
            questionwidgets.add(
              CheckQuestion(
                item["question"],
                optionList,
                (Map<String, dynamic> mp) {
                  for (Answer option in questions[newQuestion.id]!.answer) {
                    option.isActive = mp[option.answer];
                  }
                },
              ),
            );
          }
          //text question
          else if (item["type"] == "radio") {
            questionwidgets.add(
              TextQuestion(
                item["question"],
                optionList,
                (String value) {},
              ),
            );
          }
        }
        
        // if (isOnline) setQuestions(snapshot.data, widget.catid);
        return Column(
          children: [
            Image.asset(widget.image),
            ...questionwidgets,
            Container(
              margin: const EdgeInsets.only(
                left: 1,
                right: 1,
                top: 1,
                bottom: 1,
              ),
              child: CupertinoButton(
                  // color: Color(4293468238),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: CupertinoColors.inactiveGray),
                  ),
                  // Text Text(),
                  onPressed: () async {
                    List<CatQuestion> lst = [];
                    for (CatQuestion ques in questions.values) {
                      lst.add(ques);
                    }
                    await saveQuestions(lst);
                    Navigator.of(context).pop();
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 1,
                bottom: 30,
              ),
              child: CupertinoButton(
                  color: Color(4293468238),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  // Text Text(),
                  onPressed: () {
                    showSuccess();
                  }),
            )
          ],
        );
      },
    );
  }
}
