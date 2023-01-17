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
  TextEditingController passCont = new TextEditingController();
  TextEditingController phoneCont = new TextEditingController();
  @override
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
              CustomButton(
                height: 40,
                width: 310,
                text: "Log In",
                margin: getMargin(
                  top: 23,
                ),
                variant: ButtonVariant.FillRed800,
                shape: ButtonShape.RoundedBorder4,
                fontStyle: ButtonFontStyle.RobotoRomanMedium14,
                onTap: () {
                  if(phoneCont.text == "1"){
                    Navigator.of(context).pushReplacementNamed('/volunteer');
                  }else{
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
