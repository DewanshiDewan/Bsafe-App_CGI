import 'package:bsafe/widgets/Alert.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';

import '../providers/Auth.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:bsafe/core/app_export.dart';
import 'package:bsafe/widgets/custom_button.dart';
import 'package:bsafe/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  var message = "";
  bool isWaiting = false;

  void showError() {
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
                child: Text('OK'),
              )
            ],
          );
        }));
  }

  //input validation here
  @override
  Future<bool> onLogIn(String userId, String password) async {
    if (userId.length == 0 || password.length == 0) {
      setState(() {
        message = "Please enter the details first.";
      });
      return false;
    }
    final response = await Provider.of<Auth>(
      context,
      listen: false,
    ).login(phoneCont.text, passCont.text);
    setState(() {
      message = response;
    });
    return Provider.of<Auth>(context, listen: false).auth;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getHorizontalSize(
                  374.00,
                ),
                margin: getMargin(
                  right: 1,
                ),
                padding: getPadding(
                  left: 58,
                  top: 4,
                  right: 58,
                  bottom: 4,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgGroup60,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 122,
                      ),
                      child: Text(
                        "Public Place Safety Audit",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            20,
                          ),
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w700,
                          height: 1.15,
                        ),
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgLayer1,
                      height: getVerticalSize(
                        40.00,
                      ),
                      width: getHorizontalSize(
                        229.00,
                      ),
                      margin: getMargin(
                        top: 153,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: getPadding(left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: phoneCont,
                          decoration: const InputDecoration(
                            // hintText: 'Enter Phone Number',
                            labelText: 'Phone',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          obscureText: true,
                          controller: passCont,
                          decoration: const InputDecoration(
                            hintText: '',
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.of(context).pushReplacementNamed('/volunteer');
                    // return;
                    setState(() {
                      isWaiting = true;
                    });
                    bool success = await onLogIn(phoneCont.text, passCont.text);
                    setState(() {
                      isWaiting = false;
                    });
                    if (!success) {
                      showError();
                      print(message);
                      return;
                    } else {
                      final mode = Provider.of<Auth>(
                        context,
                        listen: false,
                      ).user.roleName;
                      if (mode == "Volunteer") {
                        Navigator.of(context)
                            .pushReplacementNamed('/volunteer');
                      } else {
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    }

                    // return;
                    // if (phoneCont.text == "1") {
                    //   Navigator.of(context).pushReplacementNamed('/volunteer');
                    // } else {
                    //   Navigator.of(context).pushReplacementNamed('/home');
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(310, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: Color(4291694125)),
                  child: isWaiting
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
