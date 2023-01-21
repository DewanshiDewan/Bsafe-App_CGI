import 'package:bsafe/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class WelcomeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      width: w,
      decoration: BoxDecoration(color: Color(4293468238)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Provider.of<Auth>(context).user.userName!,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Last Survey : 12/12/2022",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Next Survey : 12/6/2023",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cats');
                  },
                  child: Text("Take Survey"),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Color(4293468238),
                      backgroundColor: Colors.white)),
            ),
            
          ],
        ),
      ),
    );
  }
}
