import 'package:bsafe/widgets/DashboardItem.dart';
import 'package:bsafe/widgets/QuestionnaireItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bsafe/screens/Questionnaire.dart';

class RecentSurveys extends StatefulWidget {
  @override
  State<RecentSurveys> createState() => _RecentSurveysState();
}

class _RecentSurveysState extends State<RecentSurveys> {
  late Future<List<Widget>> surveys;

  Future<List<Widget>> getSurveys() async {
    //fetch surveys here
    return [
      DashboardItem(
          "assets/Bus StopIcon.png", "Bus Stop, Banashankari", () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) {
            return Questionnaire("assets/Bus Stop.jpg", "2","online");
          },
        ));
      }),
      DashboardItem(
          "assets/AnganwadiIcon.png", "Anganwadi, Banashankari", () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) {
            return Questionnaire("assets/Anganwadi.jpg", "1","online");
          },
        ));
      }),
    ];
  }

  @override
  void initState() {
    surveys = getSurveys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: surveys,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 30,
            ),
            child: Column(children: const [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            ]),
          );
        }
        int numItems = snapshot.data!.length;
        return Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const[
              Padding(
                padding: EdgeInsets.only(top : 8.0, bottom: 8.0, left: 15),
                child: Text(
                  "Recent Surveys",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          ...?snapshot.data,
        ]);
      }),
    );
  }
}
