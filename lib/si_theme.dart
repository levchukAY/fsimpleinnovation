import 'package:flutter/material.dart';

class SiTheme {
  static final SiTheme _instance = SiTheme._internal();

  static SiTheme get() => _instance;

  SiTheme._internal();

  Color? primaryColor;

  final Color gray68 = const Color(0xff686868);
  final Color gray22 = const Color(0xff222222);
  final Color separatorColor = const Color(0xfff2f2f2);

  void setColor(Color color) {
    primaryColor = color;
  }

  TextStyle titleTextStyle() => TextStyle(
    fontSize: 22.0,
    color: gray22,
  );

  TextStyle subtitleTextStyle() => TextStyle(
    fontSize: 20.0,
    color: gray68,
    fontWeight: FontWeight.w300,
  );
}
