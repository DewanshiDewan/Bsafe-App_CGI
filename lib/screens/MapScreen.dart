import 'package:bsafe/widgets/LocationForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bsafe/providers/Auth.dart';
import 'package:bsafe/widgets/VolunteerDashList.dart';
import 'package:flutter/material.dart';
import 'package:bsafe/core/app_export.dart';
import 'package:bsafe/widgets/appbar_image.dart';
import 'package:bsafe/widgets/custom_app_bar.dart';
import 'package:bsafe/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Scaffold(
      appBar: CustomAppBar(
                height: getVerticalSize(60.00),
                title: Padding(
                    padding: getPadding(left: 19, top: 5),
                    child: Row(children: [
                      Container(
                          width: getSize(60.00),
                          padding: getPadding(
                              left: 17, top: 5, right: 17, bottom: 5),
                          decoration: AppDecoration.txtOutlinePink50001
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.txtCircleBorder30),
                          child: Text(authProvider.user.userName![0].toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtNunitoBold34
                                  .copyWith(height: getVerticalSize(0.34)))),
                      AppbarImage(
                          height: getVerticalSize(29.00),
                          width: getHorizontalSize(166.00),
                          svgPath: ImageConstant.imgLayer1,
                          margin: getMargin(left: 46, top: 21, bottom: 10))
                    ]))),
      body: LocationForm(true),
    );
  }
}