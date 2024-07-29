import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_software/domain/repositories/color_generation_repository.dart';

/// Generates random colors
@lazySingleton
class ColorGenerationUseCases {
  final ColorGenerationRepository _colorGenerationRepository;

  /// Generates random colors
  ColorGenerationUseCases(this._colorGenerationRepository);

  /// Generate random color (from 16777216 colors)
  Color getRandomRGBColor() {
    return _colorGenerationRepository.getRandomRGBColor();
  }
}
