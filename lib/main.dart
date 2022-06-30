import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:healthensuite/screens/login/login_screen.dart';
import 'dart:ui';
import 'package:healthensuite/utilities/constants.dart';


// void main() => runApp(new MyApp());

Future<void> main() async {
  await init(); //
  runApp(MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.instance.getToken().then((token){
    print("token $token");
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = window.physicalSize.width;

    return new MaterialApp(
      theme: new ThemeData(primarySwatch: appBackgroundMaterialColor, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
     // home: new HomeScreen(),
      home: LoginScreen(),
    );
  }
}


