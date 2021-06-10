import 'package:flutter/material.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
//import 'package:healthensuite/utilities/constants.dart';


class SleepReport extends StatelessWidget {

  final Function onMenuTap;
  static final String title = 'Sleep Report';

  const SleepReport({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 3,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      
    );
  }
}