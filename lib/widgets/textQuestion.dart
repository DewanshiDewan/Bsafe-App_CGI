import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/db_helper.dart';

import '../models/Answer.dart';

class TextQuestion extends StatefulWidget {
  final String ques;
  final List<Answer> answers;
  final Function update;

  TextQuestion(this.ques, this.answers, this.update);

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  final _ansCont = TextEditingController();

  @override
  void initState() {
  }

  @override
  void dispose() {
    _ansCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(15),
      child: Card(
        elevation: 6,
        child: Column(children: [
          Container(
              margin: EdgeInsets.all(15),
              child: Text(
                widget.ques,
                style: TextStyle(
                  fontSize: 19,
                ),
              )),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: _ansCont,
              decoration: const InputDecoration(
                hintText: "Enter your answer here",
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color : Color(4293468238)))
              ),
              maxLines: 1,
              style: TextStyle(fontSize: 17, color: CupertinoColors.black),
            ),
          )
        ]),
      ),
    );
  }
}
