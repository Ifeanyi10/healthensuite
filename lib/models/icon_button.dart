import 'package:flutter/material.dart';

class IconUserButton extends StatelessWidget{
  final String? buttonText;
  final IconData? buttonIcon;
  final Function? buttonEvent;

  IconUserButton({this.buttonIcon, this.buttonText, this.buttonEvent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: buttonEvent as void Function()?,
      label: Text(buttonText!),
      icon: Icon(buttonIcon),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent, // background
        onPrimary: Colors.white, // foreground
      ),
    );
  }
}