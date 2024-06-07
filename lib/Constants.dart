import 'package:flutter/material.dart';

class Constants
{
  static int radioValue = 0;
  static String light = "light";
  static String dark = "dark";
  static String default_ = "default";
  static String status = light;
  static bool darkModeOn;
  static ThemeData darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );
  static ThemeData lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue
  );
}