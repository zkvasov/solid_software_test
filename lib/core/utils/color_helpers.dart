import 'dart:math' as math;

import 'package:flutter/material.dart';

class ColorUtil {
  /// randomly generates one from 16777216 colors
  static Color getRandomColor() {
    return Color.fromRGBO(
      math.Random().nextInt(0xFF),
      math.Random().nextInt(0xFF),
      math.Random().nextInt(0xFF),
      1,
    );
    // return Color(math.Random().nextInt(0xFFFFFF)).withAlpha(0xFF);
  }
}
