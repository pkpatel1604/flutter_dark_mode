import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dark_mode/Constants.dart';
import 'package:flutter_dark_mode/NavigationUtil.dart';
import 'package:flutter_dark_mode/SharedPreferenceHelper.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> with WidgetsBindingObserver {

  SharedPreferenceHelper sharedPreferenceHelper = new SharedPreferenceHelper();

  @override
  void initState()
  {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
      setState(() {
        Constants.darkModeOn = brightness == Brightness.dark;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(microseconds: 1), (){
      setState(() {
        Constants.status = Constants.status;
        Constants.radioValue = Constants.radioValue;
      });
    });
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.status == Constants.light ? Constants.lightTheme : Constants.status == Constants.dark ? Constants.darkTheme : Constants.darkModeOn ? Constants.darkTheme : Constants.lightTheme,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    Constants.status == Constants.default_ ? 'Default Mode' : Constants.status == Constants.dark ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                        Icons.settings
                    ),
                    onPressed: () => NavigationUtil.openSettingScreen(context)),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*FlutterSwitch(
                  width: 100.0,
                  height: 50.0,
                  valueFontSize: 25.0,
                  toggleSize: 40.0,
                  value: Constants.isToggled,
                  borderRadius: 25.0,
                  padding: 8.0,
                  onToggle: (val) {
                    setState(() {
                      Constants.isToggled = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),*/
                InkWell(
                  child: Text(
                    'Second Screen',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  onTap: () => NavigationUtil.openSecondScreen(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Dark mode is ' + Constants.darkModeOn.toString() + '.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
