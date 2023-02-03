import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#82225E');
  static Color second = HexColor.fromHex('#0E4057');
  static Color white = Colors.white;
  static Color black = Colors.black;
// red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}