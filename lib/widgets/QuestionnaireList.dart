import 'package:bsafe/widgets/QuestionnaireItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionnaireList extends StatelessWidget {
  Function buttonHandler;
  String icon;
  QuestionnaireList(this.buttonHandler, this.icon);
  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [];
    for (int i = 0; i < 10; i++) {
      tiles.add(QuestinnaireItem(
          icon, "Bus Stop, Banashankari 2nd Stage", buttonHandler));
    }
    return IntrinsicHeight(
      child: Column(children: tiles),
    );
  }
}
