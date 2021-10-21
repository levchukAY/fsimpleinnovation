import 'package:flutter/material.dart';

class ScreenDensityUtils {

  static final ScreenDensityUtils _instance = ScreenDensityUtils._internal();

  static ScreenDensityUtils get() => _instance;

  ScreenDensityUtils._internal();

  double _scaleFactor = 1.0;

  void init(BuildContext context) {
    _scaleFactor = 1.6;
    return;
    var screenDensity = MediaQuery.of(context).size.width;
    if (screenDensity == 0) {
      _scaleFactor = 1.0;
    } else if (screenDensity > 700.0) {
      _scaleFactor = 1.6;
    } else if (screenDensity > 500.0) {
      _scaleFactor = 1.3;
    } else if (screenDensity <= 360.0) {
      _scaleFactor = 0.9;
    } else if (screenDensity <= 320.0) {
      _scaleFactor = 0.8;
    }
  }

  double scaleSize(double size) => size * _scaleFactor;
}
