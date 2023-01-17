// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bsafe/providers/Category.dart';
import 'package:bsafe/screens/Questionnaire.dart';
import 'package:bsafe/widgets/Alert.dart';
import 'package:bsafe/widgets/QuestionnaireList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../widgets/CategoryQuestionnaire.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> response;

  Future<bool> connectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<List<dynamic>> getResponse() async {
    final isConnected = await connectivity();
    if (isConnected) {
      print("online");
      return fetchCategories();
    } else {
      print("offline");
      return fetchCategoriesLocal();
    }
  }

  @override
  void initState() {
    response = getResponse();
    super.initState();
  }

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

    return FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }
          List<Tab> tablist = [];
          List<Widget> Questlist = [];

          for (int i = 0; i < snapshot.data.length; i++) {
            tablist.add(Tab(text: snapshot.data[i]["categoryname"]));
            Questlist.add(QuestionnaireList(() {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) {
                  return Questionnaire(
                      "assets/" + snapshot.data[i]["categoryname"] + ".jpg",
                      snapshot.data[i]["id"],'online');
                },
              ));
            }, "assets/" + snapshot.data[i]["categoryname"] + "Icon.png"));
          }

          setCategories(snapshot.data);
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

                  SvgPicture.asset("assets/logos/bsafe_cgi.svg"),

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

                  //search bar
                  /*Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(230, 230, 230, 1),
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
                  ),*/

                  //TabView
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin:
                        const EdgeInsets.only(top: 20, left: 25, bottom: 20),
                    child: const Text(
                      "Categories",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: TabBar(
                                  isScrollable: true,
                                  tabs: tablist,
                                  unselectedLabelColor: Colors.black,
                                  labelColor: Colors.white,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        50), // Creates border
                                    color: Color(4293468238),
                                  )),
                            )),
                        Container(
                          // width: w,
                          height: 2 * h,
                          child: TabBarView(children: Questlist),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
