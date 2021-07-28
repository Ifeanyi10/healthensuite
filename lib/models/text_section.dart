import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget{
  final String? myText;
  final double? lPad;
  final double? tPad;
  final double rPad; //already declared
  final double bPad; //already declared
  final double fontSize; //already declared
  final Color color; //already declared
  final FontWeight fontWeight; //already declared
  final TextDecoration textDecoration;


  TextSection({this.myText, this.lPad, this.tPad, this.rPad = 0.0, 
    this.bPad = 0.0, this.fontSize = 70.0, this.color = Colors.white, 
    this.fontWeight = FontWeight.bold, this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(lPad!, tPad!, rPad, bPad),
      child: Text(myText!,
          style: TextStyle(
              fontSize: fontSize, 
              fontWeight: fontWeight, 
              color: color, 
              fontFamily: 'Montserrat',
              decoration: textDecoration
              )
      ),
    );
  }
}