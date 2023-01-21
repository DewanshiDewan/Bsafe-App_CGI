import 'package:bsafe/widgets/Alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return AlertDialog(
      // alignment: Alignment.bottomCenter,
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Color.fromRGBO(1, 1, 1, 0),
      content: IntrinsicHeight(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 80, bottom: 20, right: 15, left: 15),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const Text(
                            "Success",
                            style: TextStyle(
                                color: Color(4286350993),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Gotham"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40, bottom: 20),
                            child: Text(
                              "Completed the Questionnaire",
                              style: TextStyle(
                                color: Color(4292074208),
                                fontSize: 16,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: StadiumBorder(),
                                  fixedSize: Size(120, 40),
                                ),
                                child: const Text(
                                  "Review",
                                  style: TextStyle(fontFamily: "Gotham"),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(4279485340),
                                  shape: StadiumBorder(),
                                  fixedSize: Size(120, 40),
                                ),
                                child: const Text(
                                  "Categories",
                                  style: TextStyle(fontFamily: "Gotham"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/success.png', height: 100, width: 100,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
