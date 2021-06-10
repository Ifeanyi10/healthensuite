import 'package:flutter/material.dart';
import 'text_section.dart';

class NameLogo extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          TextSection(myText: 'Health', lPad: 40, tPad: 90),
          TextSection(myText: 'enSuite', lPad: 40, tPad: 155),
          TextSection(myText: '.', lPad: 312, tPad: 155, color: Colors.blueAccent,),
          
        ],
      ),
    );
  }
}