import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kItemExtent = 32.0;

class DropdownQuestion extends StatefulWidget {
  final String ques;
  final bool isAns;
  final String ans;
  final List<String> options;
  final Function update;

  DropdownQuestion(
    this.ques,
    this.isAns,
    this.ans,
    this.options,
    this.update,
  );

  @override
  State<DropdownQuestion> createState() => _DropdownQuestionState();
}

class _DropdownQuestionState extends State<DropdownQuestion> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  String selected = "";
  @override
  void initState() {
    String initselected = widget.options[0];
    if (widget.options.contains(widget.ans)) {
      initselected = widget.ans;
    }
    setState(() {
      selected = initselected;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> options = widget.options.map((e) => Text(e)).toList();
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
            CupertinoButton(
              child: Text(
                selected,
                style:
                    TextStyle(color: CupertinoTheme.of(context).primaryColor),
              ),
              onPressed: () {
                _showDialog(CupertinoPicker(
                    itemExtent: _kItemExtent,
                    onSelectedItemChanged: ((value) {
                      setState((){
                        selected = widget.options[value];
                        widget.update(selected);
                      });
                    }),
                    children: options));
              },
            ),
          ],
        ),
      ),
    );
  }
}
