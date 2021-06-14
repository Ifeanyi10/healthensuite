import 'package:flutter/material.dart';

class RowItemEdit extends StatelessWidget{
  final IconData rowIcon;
  final IconData buttonIcon;
  final String rowText;
  final Function buttonEvent;

  RowItemEdit({this.rowIcon, this.buttonIcon, this.rowText, this.buttonEvent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Icon(
            rowIcon,
            color: Colors.blueAccent,
          ),
          SizedBox(width: 10.0),
          Text(
            rowText,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 1.0,),
          IconButton(
            onPressed: buttonEvent,
            icon: Icon(buttonIcon),
          ),
        ],
      ),
    );
  }
}