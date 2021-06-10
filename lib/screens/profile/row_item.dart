import 'package:flutter/material.dart';

class RowItem extends StatelessWidget{
  final IconData rowIcon;
  final String rowText;

  RowItem({this.rowIcon, this.rowText});

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
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}