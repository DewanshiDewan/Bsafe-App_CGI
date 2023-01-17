import 'package:bsafe/providers/CatQuestions.dart';
import 'package:bsafe/widgets/QuestionnaireItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bsafe/screens/Questionnaire.dart';

class SavedSurveys extends StatefulWidget {
  @override
  State<SavedSurveys> createState() => _SavedSurveysState();
}

class _SavedSurveysState extends State<SavedSurveys> {
  late Future<List<Widget>> surveys;

  Future<List<Widget>> getSurveys() async {
    //fetch surveys here
    return [
      QuestinnaireItem_2(
          "assets/Bus StopIcon.png", "Bus Stop, Banashankari 2nd Stage", () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) {
            return Questionnaire("assets/Bus Stop.jpg", "2","saved");
          },
        ));
      }),
      QuestinnaireItem_2(
          "assets/AnganwadiIcon.png", "Anganwadi, Banashankari 2nd Stage", () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) {
            return Questionnaire("assets/Anganwadi.jpg", "1","saved");
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
                  "Saved Surveys",
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
