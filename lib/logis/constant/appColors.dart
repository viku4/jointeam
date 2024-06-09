import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xffff6263);

Color black = const Color(0xFF000000);
Color materialButtonColor = const Color(0xFFE44533);

Color lightAppBar = const Color(0xFFffffff);
Color lightBackground = const Color(0xFFe9e8ec);
Color darkBackground = const Color(0xFF151c1e);
Color darkAppBar = const Color(0xFF141417);

Color grey = const Color(0xFF9E9E9E);

Color shimmerGrey = const Color(0xFF9E9E9E);

Color darkgreen = const Color(0xFF046B3E);

Color lightgreen = const Color(0xFF87C558);

Color white = const Color(0xFFFFFFFF);

Color blue = const Color(0xFF2196F3);

Color green400 = const Color(0xFF66BB6A);

Color grey200 = const Color(0xFFEEEEEE);

Color red = Colors.red;
// Color red = Colors.red;

Color green = Colors.green;

Color blueGrey = Colors.blueGrey;

Color teal = Colors.teal;

Color white24 = Colors.white24;

Color greyShade400 = Colors.grey.shade400;

Color blueShade700 = Colors.blue.shade700;

Color greenShade300 = Colors.green.shade300;

Color whiteShade200 = Colors.grey.shade200;

Color greyShade100 = Colors.grey.shade100;

Color orange = const Color.fromARGB(255, 255, 135, 7);

class PrimaryColor {
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE1EDE8),
    100: Color(0xFFB4D3C5),
    200: Color(0xFF82B59F),
    300: Color(0xFF4F9778),
    400: Color(0xFF2A815B),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF036338),
    700: Color(0xFF035830),
    800: Color(0xFF024E28),
    900: Color(0xFF013C1B),
  });
  static const int _primaryPrimaryValue = 0xFF046B3E;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF72FFA2),
    200: Color(_primaryAccentValue),
    400: Color(0xFF0CFF5F),
    700: Color(0xFF00F152),
  });
  static const int _primaryAccentValue = 0xFF3FFF80;
}
