import 'package:flutter/material.dart';
import 'package:bsafe/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtFillPink500 => BoxDecoration(
    color: ColorConstant.pink500,
  );
  static BoxDecoration get outlineTealA200 => BoxDecoration(
    color: ColorConstant.tealA700,
    border: Border.all(
      color: ColorConstant.tealA200,
      width: getHorizontalSize(
        3.00,
      ),
    ),
  );
  static BoxDecoration get outlineBlack90021 => BoxDecoration(
    color: ColorConstant.red800,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black90021,
        spreadRadius: getHorizontalSize(
          2.00,
        ),
        blurRadius: getHorizontalSize(
          2.00,
        ),
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get fillGray50 => BoxDecoration(
    color: ColorConstant.gray50,
  );
  static BoxDecoration get outlineBlack90014 => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black90014,
        spreadRadius: getHorizontalSize(
          2.00,
        ),
        blurRadius: getHorizontalSize(
          2.00,
        ),
        offset: Offset(
          0,
          2,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineRed800 => BoxDecoration(
    border: Border.all(
      color: ColorConstant.red800,
      width: getHorizontalSize(
        1.00,
      ),
    ),
  );
  static BoxDecoration get txtFillRed800 => BoxDecoration(
    color: ColorConstant.red800,
  );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: ColorConstant.whiteA700,
  );
  static BoxDecoration get txtOutlinePink50001 => BoxDecoration(
    color: ColorConstant.pink50001,
    border: Border.all(
      color: ColorConstant.pink50001,
      width: getHorizontalSize(
        1.00,
      ),
    ),
  );
  static BoxDecoration get txtFillPink50001 => BoxDecoration(
    color: ColorConstant.pink50001,
  );
  static BoxDecoration get fillPink50001 => BoxDecoration(
    color: ColorConstant.pink50001,
  );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
    color: ColorConstant.gray50,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.black9003f,
        spreadRadius: getHorizontalSize(
          2.00,
        ),
        blurRadius: getHorizontalSize(
          2.00,
        ),
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get fillPink500 => BoxDecoration(
    color: ColorConstant.pink500,
  );
  static BoxDecoration get fillBluegray10004 => BoxDecoration(
    color: ColorConstant.blueGray10004,
  );
  static BoxDecoration get fillRed800 => BoxDecoration(
    color: ColorConstant.red800,
  );
  static BoxDecoration get fillGray100 => BoxDecoration(
    color: ColorConstant.gray100,
  );
  static BoxDecoration get fillGray5001 => BoxDecoration(
    color: ColorConstant.gray5001,
  );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30.00,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius txtCircleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50.00,
    ),
  );

  static BorderRadius customBorderTL25 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        25.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        25.00,
      ),
    ),
  );

  static BorderRadius txtCircleBorder11 = BorderRadius.circular(
    getHorizontalSize(
      11.00,
    ),
  );

  static BorderRadius customBorderBL10 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
  );

  static BorderRadius circleBorder7 = BorderRadius.circular(
    getHorizontalSize(
      7.00,
    ),
  );
}
