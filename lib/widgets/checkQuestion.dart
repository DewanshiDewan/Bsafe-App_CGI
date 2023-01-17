import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Answer.dart';

class RadioOption extends StatelessWidget {
  bool isSelected;
  String image;
  String text;
  RadioOption(this.isSelected, this.image, this.text);

  @override
  Widget build(BuildContext context) {
    Color txtclr = (isSelected ? Colors.white : Colors.black);
    Color bgclr = (isSelected ? Color(4293468238) : Colors.white);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        color: bgclr,
        elevation: 2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 8, 15, 5),
              child: Image.asset('assets/optionIcons/' + image),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 8),
              child: Text(
                text,
                style: TextStyle(color: txtclr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckQuestion extends StatefulWidget {
  final String ques;
  final List<Answer> answers;
  final Function update;

  CheckQuestion(
    this.ques,
    this.answers,
    this.update,
  );

  @override
  State<CheckQuestion> createState() => _CheckQuestionState();
}

class _CheckQuestionState extends State<CheckQuestion> {
  Map<String, bool> mp = {};
  @override
  void initState() {
    setState(() {
      for (Answer ans in widget.answers) {
        setState(() {
          mp[ans.answer] = ans.isActive;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final optionWidgets = widget.answers.map((item) {
      return GestureDetector(
        onTap: () {
          setState(() {
            mp[item.answer] = !(mp[item.answer]!);
          });
          widget.update(mp);
        },
        child: RadioOption(
          mp[item.answer]!,
          item.image,
          item.answer,
        ),
      );
    }).toList();
    return Container(
      margin: EdgeInsets.all(15),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                widget.ques,
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: optionWidgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
