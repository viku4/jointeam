import 'package:flutter/material.dart';
import 'package:jointeam/logis/constant/appColors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      fontFamily: "Barlow",
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: black,
        ),
        backgroundColor: lightAppBar,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: white,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: TextStyle(
            color: white,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: black,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: PrimaryColor.primary,
        brightness: Brightness.light,
        background: lightBackground,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: white,
        iconColor: black,
      ));
  static ThemeData appThemeDark = ThemeData(
      fontFamily: "Barlow",
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: white,
        ),
        backgroundColor: black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: white,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: TextStyle(
            color: white,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: white,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: white,
        background: darkAppBar,
        brightness: Brightness.dark,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: black,
        iconColor: white,
      ));
}
