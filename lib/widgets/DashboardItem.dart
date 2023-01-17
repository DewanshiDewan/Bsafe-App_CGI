import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bsafe/helpers/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import '../constants.dart';
import '../helpers/locater.dart';

class DashboardItem extends StatelessWidget {
  String image;
  String title;
  Function buttonHandler;
  DashboardItem(this.image, this.title, this.buttonHandler);

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
        trailing: TextButton(
          child: SvgPicture.asset("assets/logos/img_rotate.svg",
              width: 20, height: 20),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                      'Alert! You are creating a revision survey to $title.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                        },
                        child: const Text('REVISE',
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
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      ),
    );
  }
}
