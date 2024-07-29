import 'package:flutter/material.dart';

/// Generates random colors
abstract class ColorGenerationRepository {
  /// Creates random color
  Color getRandomRGBColor();
}
