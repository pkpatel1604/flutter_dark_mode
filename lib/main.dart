import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dark_mode/Constants.dart';
import 'package:flutter_dark_mode/FirstScreen.dart';
import 'package:flutter_dark_mode/SharedPreferenceHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper sharedPreferenceHelper = new SharedPreferenceHelper();
  Constants.status = await sharedPreferenceHelper.getData();
  if(Constants.dark ==  Constants.status)
    Constants.radioValue = 1;
  else if(Constants.light ==  Constants.status)
    Constants.radioValue = 0;
  else
    Constants.radioValue = 2;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  SharedPreferenceHelper sharedPreferenceHelper = new SharedPreferenceHelper();
  bool flag = false;

  @override
  void initState()
  {
    super.initState();
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    Constants.darkModeOn = brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.status == Constants.light ? Constants.lightTheme : Constants.status == Constants.dark ? Constants.darkTheme : Constants.darkModeOn ? Constants.darkTheme : Constants.lightTheme,
      home: FirstScreen() ,
    );
  }
}