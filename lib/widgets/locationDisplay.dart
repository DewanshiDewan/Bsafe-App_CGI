import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocationDisplay extends StatelessWidget {
  final double? lat, long;
  LocationDisplay(this.lat, this.long);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
          elevation: 6,
          color: CupertinoColors.black,
          child: Container(
            margin: EdgeInsets.all(8),
            child: Text(
              "Last captured location     :    ( " +
                  lat.toString() +
                  " , " +
                  long.toString() +
                  " )",
              style: TextStyle(
                color: CupertinoColors.white,
              ),
            ),
          )),
    );
  }
}
