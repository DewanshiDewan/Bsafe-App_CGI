import 'package:bsafe/providers/Auth.dart';
import 'package:bsafe/widgets/VolunteerDashList.dart';
import 'package:flutter/material.dart';
import 'package:bsafe/core/app_export.dart';
import 'package:bsafe/widgets/appbar_image.dart';
import 'package:bsafe/widgets/custom_app_bar.dart';
import 'package:bsafe/widgets/custom_button.dart';
import 'package:provider/provider.dart';
// import 'package:bsafe/screens/volunteer_map_one_bottomsheet/volunteer_map_one_bottomsheet.dart';
// import 'package:bsafe/screens/volunteer_map_bottomsheet/volunteer_map_bottomsheet.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class VolunteerDashboardScreen extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
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
            body: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  padding: getPadding(top: 10, bottom: 48),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: size.width,
                            padding: getPadding(all: 19),
                            decoration: AppDecoration.fillPink50001,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text(authProvider.user.userName!,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold24
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.00)))),
                                  Padding(
                                      padding: getPadding(left: 3, top: 1),
                                      child: Text("Volunteer",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtGothamMedium14WhiteA700
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(2.69)))),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/map');
                                        },
                                        child: Text("Add New Location"),
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Color(4293468238),
                                            backgroundColor: Colors.white)),
                                  )
                                ])),
                        Padding(
                            padding: getPadding(left: 23, top: 17),
                            child: Text("Location List",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNunitoBold18Bluegray900
                                    .copyWith(height: getVerticalSize(0.98)))),
                        Padding(
                            padding: getPadding(left: 2, top: 14),
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                      height: getVerticalSize(5.00));
                                },
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return VolunteerDashListWidget(
                                      onTapTxtLanguage: () =>
                                          onTapTxtLanguage(context));
                                }))
                      ])),
            )));
  }

  onTapTxtLanguage(BuildContext context) {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (_) => VolunteerMapOneBottomsheet(),
    //     isScrollControlled: true);
  }

  onTapAddnewlocationOne(BuildContext context) {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (_) => VolunteerMapBottomsheet(),
    //     isScrollControlled: true);
  }
}
