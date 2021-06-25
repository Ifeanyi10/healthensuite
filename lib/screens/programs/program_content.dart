import 'package:flutter/material.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
//import 'package:healthensuite/utilities/constants.dart';


class ProgramContent extends StatelessWidget{

  final Function? onMenuTap;
   static final String title = 'Program Content';

  const ProgramContent({Key? key, this.onMenuTap}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 4,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      
    );
  }
}