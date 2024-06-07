
import 'package:flutter/material.dart';
import 'package:flutter_dark_mode/AnimationUtil.dart';
import 'package:flutter_dark_mode/FirstScreen.dart';
import 'package:flutter_dark_mode/SecondScreen.dart';
import 'package:flutter_dark_mode/SettingScreen.dart';
import 'package:flutter_dark_mode/ThirdScreen.dart';

class NavigationUtil {
  static void openSecondScreen(BuildContext context) {
    Navigator.push(
      context,
      SlideLeftRoute(page: SecondScreen()),
    );
  }

  static void openFirstScreen(BuildContext context) {
    Navigator.push(
      context,
      SlideLeftRoute(page: FirstScreen()),
    );
  }

  static void openThirdScreen(BuildContext context) {
    Navigator.push(
      context,
      SlideLeftRoute(page: ThirdScreen()),
    );
  }

  static void openSettingScreen(BuildContext context) {
    Navigator.push(
      context,
      SlideLeftRoute(page: SettingScreen()),
    );
  }
}