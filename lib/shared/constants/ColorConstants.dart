import 'package:flutter/material.dart';

class ColorConstants {
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray500 = hexToColor('#242526');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color navBarIconColor = hexToColor('#BDBDD5');
  static Color shimmerBackgroundGrey = hexToColor('#F8F8F8');
  static Color backgroundContainer = hexToColor('#EDF2F8');
  static Color backgroundContainerLightColor = hexToColor('#EDEDED');
  static Color black0 = hexToColor('#0e0f0f');
  static Color greyColor = hexToColor('#808080');
  static Color blackColor = hexToColor('#252525');
  static const Color mainColor = Color.fromRGBO(241, 94,56,1);
  static  Color btnBackgroundGrey = hexToColor('#F8F8F8');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
