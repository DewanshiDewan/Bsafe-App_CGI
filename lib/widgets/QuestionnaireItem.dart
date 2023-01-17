import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bsafe/helpers/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import '../constants.dart';
import '../helpers/locater.dart';

class QuestinnaireItem extends StatelessWidget {
  String image;
  String title;
  Function buttonHandler;
  QuestinnaireItem(this.image, this.title, this.buttonHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title),
        subtitle: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SvgPicture.asset("assets/logos/walk.svg", width: 20, height: 20),
              const Text("5 Mins"),
              SvgPicture.asset("assets/logos/pin.svg", width: 15, height: 15),
              const Text("0.1 Km"),
              TextButton.icon(
                icon: SvgPicture.asset("assets/logos/start.svg"),
                label: const Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  MapUtils.openMap(ECITY_LAT, ECITY_LON);
                },
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text("Take Survey"),
                  onPressed: () async {
                    Position current_loc = await Locater.determinePosition();
                    double dist = Geolocator.distanceBetween(
                        current_loc.latitude,
                        current_loc.longitude,
                        ECITY_LAT,
                        ECITY_LON);
                    print(dist);
                    if (dist <= 84758748574)
                    // if(dist <= SURVEY_RADIUS)
                    {
                      buttonHandler();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                              'Alert! You are away from the selected location.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  MapUtils.openMap(ECITY_LAT, ECITY_LON);
                                },
                                child: const Text('NAVIGATE',
                                    style: TextStyle(
                                      color: Color(4293468238),
                                    ))),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('CANCEL',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )))
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(4293468238),
                    maximumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuestinnaireItem_2 extends StatelessWidget {
  String image;
  String title;
  Function buttonHandler;
  QuestinnaireItem_2(this.image, this.title, this.buttonHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title,style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('11/2/2021', textAlign: TextAlign.left),
          ],
        ),
        trailing: ElevatedButton(
          child: Text("Take Survey"),
          onPressed: () async {
            Position current_loc = await Locater.determinePosition();
            double dist = Geolocator.distanceBetween(current_loc.latitude,
                current_loc.longitude, ECITY_LAT, ECITY_LON);
            print(dist);
            if (dist <= 84758748574)
            // if(dist <= SURVEY_RADIUS)
            {
              buttonHandler();
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text(
                      'Alert! You are away from the selected location.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          MapUtils.openMap(ECITY_LAT, ECITY_LON);
                        },
                        child: const Text('NAVIGATE',
                            style: TextStyle(
                              color: Color(4293468238),
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL',
                            style: TextStyle(
                              color: Colors.grey,
                            )))
                  ],
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 7),
            textStyle: const TextStyle(
              fontSize: 11,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(4293468238),
            maximumSize: Size(100, 40),
            shape: StadiumBorder(),
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      ),
    );
  }
}
