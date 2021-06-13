import 'package:flutter/material.dart';
import 'dart:ui';
// import 'models/background.dart';
// import 'models/login_input.dart';
// import 'models/name_logo.dart';
// import 'screens/profile/profile_screen.dart';
//import 'screens/login/login_screen.dart';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/screens/home/home_screen.dart';
//import 'package:healthensuite/screens/sleepDiary/sleep_diary.dart';
//import 'package:healthensuite/screens/sleepReport/sleep_report.dart';
//import 'screens/dashboard/menu_dashboard_layout.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = window.physicalSize.width;

    return new MaterialApp(
      theme: new ThemeData(primarySwatch: appBackgroundMaterialColor, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
      home: new HomeScreen(),
    );
  }
}


