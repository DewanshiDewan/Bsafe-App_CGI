import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class LocationForm extends StatefulWidget {
  final bool saveMode;
  LocationForm(this.saveMode);

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  TextEditingController latLong = TextEditingController();
  TextEditingController zoneId = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();

  String assembly = "Assembly";
  String ward = "Ward";

  bool isWaiting = false;

  Future<bool> save(
    String public_place,
    String name,
    String landmark,
    String lat,
    String long,
    String ward_id,
  ) async {
    Map<String, String> body = {
      "public_place": public_place,
      "name": name,
      "landmark": landmark,
      "lat": lat,
      "long": long,
      "ward_id": ward_id,
    };
    final response = await http.post(
      Uri.parse("https://bpac.in/b-safe-constituency/cgi/savelocation.php"),
      body: body,
    );
    return jsonDecode(response.body)[0]["Responseid"] != null;
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Dismiss"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/volunteer');
                },
                child: Text("Open Dashboard"),
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          TextField(
            controller: latLong,
            decoration: const InputDecoration(
              hintText: "Latitude Longitude",
            ),
          ),
          TextField(
            controller: zoneId,
            decoration: const InputDecoration(
              hintText: "Zone ID",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: assembly,
                items: [
                  DropdownMenuItem(value: "Assembly", child: Text("Assembly")),
                  DropdownMenuItem(value: "B", child: Text("B")),
                  DropdownMenuItem(value: "C", child: Text("C")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    assembly = value!;
                  });
                },
              ),
              DropdownButton<String>(
                value: ward,
                items: [
                  DropdownMenuItem(value: "Ward", child: Text("Ward")),
                  DropdownMenuItem(value: "B", child: Text("B")),
                  DropdownMenuItem(value: "C", child: Text("C")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    ward = value!;
                  });
                },
              ),
            ],
          ),
          TextField(
            controller: location,
            decoration: const InputDecoration(
              hintText: "Location",
            ),
          ),
          TextField(
            controller: landmark,
            decoration: const InputDecoration(
              hintText: "Landmark",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Color(4293468238)),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.location_searching_rounded),
                    Text("Locate"),
                  ],
                ),
              ),
              isWaiting
                  ? CircularProgressIndicator(color: Colors.black)
                  : TextButton(
                      child: Text("Submit"),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      onPressed: () async {
                        final temp = latLong.text.split(',');
                        setState(() {
                          isWaiting = true;
                        });
                        final success = await save(
                          "Bus Stops",
                          location.text,
                          landmark.text,
                          temp[0].trim(),
                          temp[0].trim(),
                          "44",
                        );
                        setState(() {
                          isWaiting = false;
                        });
                        if (success) {
                          showMessage("Successfully submitted");
                        } else {
                          showMessage("Sorry, couldn't save the details.");
                        }
                      },
                    )
            ],
          )
        ],
      ),
    );
  }
}
