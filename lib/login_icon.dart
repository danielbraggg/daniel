import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  MyIcon({this.icon, this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
    );
  }
}
