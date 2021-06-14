import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final String _assetPath;

  Background(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Image(
          image: new AssetImage(_assetPath),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        );
  }
}