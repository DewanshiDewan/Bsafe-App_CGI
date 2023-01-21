// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bsafe/providers/Category.dart';
import 'package:bsafe/widgets/Alert.dart';
import 'package:bsafe/widgets/QuestionnaireList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../widgets/CategoryQuestionnaire.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Questionnaire extends StatefulWidget {
  String image;
  String catid;
  String fetchMode;
  Questionnaire(this.image, this.catid, this.fetchMode);
  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  void showAssembly() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Alert(
            "Select your Assembly",
            ["Vidhan Sabha", "Vidhan Parishad"],
            [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showConstituency();
                },
                child: Text("NEXT"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(4293468238),
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 40)),
              )
            ],
          );
        });
  }

  void showConstituency() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Alert(
            "Select your Constituency",
            ["Dasarahalli", "Mahadevapura"],
            [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("SUBMIT"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(4293468238),
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 40)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showAssembly();
                },
                child: Text("BACK"),
                style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 40, left: 20),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/profile.jpg",
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Color(4293468238),
                        size: 30,
                      ),
                      GestureDetector(
                        onTap: showAssembly,
                        child: SizedBox(
                          width: w * 0.4,
                          child: const Text(
                            "Banashankari, Bangalore",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 15, top: 30),
                    child: const Icon(
                      Icons.notifications_on_outlined,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            ),

            //search bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(242, 242, 242, 1),
                  label: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: Color.fromRGBO(200, 200, 200, 1),
                        ),
                      ),
                    ],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: SvgPicture.asset("assets/logos/bsafe_cgi.svg"),
            ),

            //welcome to bsafe
            /*Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: const EdgeInsets.only(top: 15, left: 25),
                    child: const Text(
                      "Welcome to B.Safe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),*/

            //TabView
            CategoryQuestionnaire(widget.image, widget.catid, widget.fetchMode),
          ],
        ),
      ),
    );
  }
}
