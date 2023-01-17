import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Alert extends StatefulWidget {
  String title;
  List<String> options;
  List<Widget> buttons;

  Alert(this.title, this.options, this.buttons);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  String? selected;
  @override
  void initState() {
    setState(() {
      selected = widget.options[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    List<Widget> options = widget.options
        .map(
          (item) => RadioListTile(
            activeColor: Color(4293468238),
            title: Text(
              item,
              style: TextStyle(fontSize: 17),
            ),
            value: item,
            groupValue: selected,
            onChanged: (value) {
              setState(() {
                selected = value;
                // widget.update(selected);
              });
            },
          ),
        )
        .toList();
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close, size: 15,))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(widget.title),
            ),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 15, bottom : 25),
          child: IntrinsicHeight(
            child: Column(children: [
              ...options,
              ...widget.buttons,
            ]),
          ),
        )
        // Container(
        //     height: widget.height,
        //     child: Column(
        //       children: [
        //         ...options,
        //         ...widget.buttons,
        //       ],
        //     )),
        );
  }
}
