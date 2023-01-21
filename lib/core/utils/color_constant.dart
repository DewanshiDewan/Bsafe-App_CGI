import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray5001 = fromHex('#f8f7fa');

  static Color blueGray10001 = fromHex('#cbcbd4');

  static Color red800 = fromHex('#ce0e2d');

  static Color blueGray10002 = fromHex('#d3dae0');

  static Color blueGray10003 = fromHex('#d0deeb');

  static Color gray80001 = fromHex('#444444');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#fbfbfb');

  static Color black90001 = fromHex('#000113');

  static Color black90021 = fromHex('#21000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray700 = fromHex('#475569');

  static Color pink500 = fromHex('#e81f4e');

  static Color blueGray900 = fromHex('#2e2e2e');

  static Color gray600 = fromHex('#828282');

  static Color tealA700 = fromHex('#13c39c');

  static Color gray400 = fromHex('#c2c2c2');

  static Color blueGray100 = fromHex('#cbd5e1');

  static Color gray60001 = fromHex('#7b7b7b');

  static Color gray500 = fromHex('#a59f9f');

  static Color blueGray400 = fromHex('#888888');

  static Color blueGray300 = fromHex('#9ba9b9');

  static Color gray800 = fromHex('#4d4d4d');

  static Color gray900 = fromHex('#33192c');

  static Color gray90001 = fromHex('#181b19');

  static Color gray300 = fromHex('#d6e4ec');

  static Color tealA200 = fromHex('#60f2d2');

  static Color gray30001 = fromHex('#dedede');

  static Color gray100 = fromHex('#f1f5f8');

  static Color black900Cc = fromHex('#cc000000');

  static Color black90033 = fromHex('#33000000');

  static Color pink50001 = fromHex('#e91e4d');

  static Color black90019 = fromHex('#19000000');

  static Color blueGray40001 = fromHex('#7c8691');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90014 = fromHex('#14000000');

  static Color blueGray10004 = fromHex('#d8d8d8');

  static Color deepPurple100 = fromHex('#d8caf7');

  static Color blueGray40002 = fromHex('#77838f');

  static Color gray90002 = fromHex('#1e2022');

  static Color gray50001 = fromHex('#acacac');

  static Color blueGray90001 = fromHex('#333333');

  static Color whiteA70001 = fromHex('#fefffe');

  static Color newblueGray400 = fromHex('#7c8691');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
