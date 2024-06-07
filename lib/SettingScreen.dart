import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dark_mode/Constants.dart';
import 'package:flutter_dark_mode/SharedPreferenceHelper.dart';

class SettingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends State<SettingScreen>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.status == Constants.light ? Constants.lightTheme : Constants.status == Constants.dark ? Constants.darkTheme : Constants.darkModeOn ? Constants.darkTheme : Constants.lightTheme,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Setting Screen',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1,
              ),
            ) ,
          ),
          body: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: Constants.radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Light',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Radio(
                      value: 1,
                      groupValue: Constants.radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Dark',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Radio(
                      value: 2,
                      groupValue: Constants.radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Default',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      Constants.radioValue = value;
      switch(value)
      {
        case 0:
          {
            setState(() => Constants.status = Constants.light );
            break;
          }
        case 1:
          {
            setState(() => Constants.status = Constants.dark );
            break;
          }
        case 2:
          {
            Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
            setState(() {
              Constants.status = Constants.default_;
              Constants.darkModeOn = brightness == Brightness.dark;
            });
            break;
          }
      }
      new SharedPreferenceHelper().setData(Constants.status);
      Navigator.pop(context);
    });
  }
}