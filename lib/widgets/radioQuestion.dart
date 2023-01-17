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

class RadioQuestion extends StatefulWidget {
  final String ques;
  final List<Answer> answers;
  final Function update;

  RadioQuestion(
    this.ques,
    this.answers,
    this.update,
  );

  @override
  State<RadioQuestion> createState() => _RadioQuestionState();
}

class _RadioQuestionState extends State<RadioQuestion> {
  String? selected;
  @override
  void initState() {
    for (Answer ans in widget.answers) {
      if (ans.isActive) {
        setState(() {
          selected = ans.answer;
        });
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.answers
        .map((item) => GestureDetector(
            onTap: () {
              setState(() {
                selected = item.answer;
              });
              widget.update(selected);
            },
            child: RadioOption(
              selected == item.answer,
              item.image,
              item.answer,
            )))
        .toList();
    // final options = widget.answers
    //     .map(
    //       (item) => RadioListTile(
    //         activeColor: CupertinoColors.black,
    //         title: Text(
    //           item.answer,
    //           style: TextStyle(fontSize: 17),
    //         ),
    //         value: item.answer,
    //         groupValue: selected,
    //         onChanged: (value) {
    //           setState(() {
    //             selected = value;
    //             // widget.update(selected);
    //           });
    //         },
    //       ),
    //     )
    //     .toList();

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
                  children: [...options],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
