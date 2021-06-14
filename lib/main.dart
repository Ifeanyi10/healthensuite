import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/screens/home/home_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = window.physicalSize.width; //gvghj

    return new MaterialApp(
      theme: new ThemeData(primarySwatch: appBackgroundMaterialColor, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
      home: new HomeScreen(),
    );
  }
}


