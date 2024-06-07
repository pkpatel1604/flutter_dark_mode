import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dark_mode/Constants.dart';
import 'package:flutter_dark_mode/NavigationUtil.dart';

class SecondScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> with WidgetsBindingObserver {
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
    Future.delayed(const Duration(microseconds: 2), (){
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
                      'Second Screen',
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                          Icons.settings
                      ),
                      onPressed: () => NavigationUtil.openSettingScreen(context)),
                ],
              ) ,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => NavigationUtil.openThirdScreen(context),
                    icon: Icon(
                     Icons.next_plan_outlined,
                    ),
                    iconSize: 70,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.backspace_outlined,
                    ),
                    iconSize: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

