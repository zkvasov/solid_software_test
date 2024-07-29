import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [ColorUtil] works with [Color]
class ColorUtil {
  static const _colorRange = 0xFF;

  static int _getRandomColorRangeValue() => math.Random().nextInt(_colorRange);

  /// randomly generates one from 16777216 colors
  static Color getRandomColor() {
    return Color.fromRGBO(
      _getRandomColorRangeValue(),
      _getRandomColorRangeValue(),
      _getRandomColorRangeValue(),
      1,
    );
    // return Color(math.Random().nextInt(0xFFFFFF)).withAlpha(0xFF);
  }
}
