import 'package:flutter/material.dart';
import 'package:bsafe/core/app_export.dart';

// ignore: must_be_immutable
class VolunteerDashListWidget extends StatelessWidget {
  VolunteerDashListWidget({this.onTapTxtLanguage});

  VoidCallback? onTapTxtLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 8,
        top: 4,
        right: 8,
        bottom: 4,
      ),
      decoration: AppDecoration.fillGray50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: getPadding(
              left: 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Bus Stop, Banashankari",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium14.copyWith(
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
                Text(
                  "Landmark : Chowdeshwari Temple",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsLight10.copyWith(
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapTxtLanguage!();
            },
            child: Padding(
                padding: getPadding(
                  top: 20,
                  bottom: 1,
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
