import 'package:flutter_dark_mode/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String key = "Key";

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String string = prefs.getString(key) ?? '';
    if (string != null && string.isNotEmpty) {
      return string;
    }
  }

  setData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }
}
