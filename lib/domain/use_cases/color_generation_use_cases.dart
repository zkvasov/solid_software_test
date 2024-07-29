import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_software/domain/repositories/color_generation_repository.dart';

@lazySingleton
class ColorGenerationUseCases {
  final ColorGenerationRepository _colorGenerationRepository;

  ColorGenerationUseCases(this._colorGenerationRepository);

  Color getRandomRGBColor() {
    return _colorGenerationRepository.getRandomRGBColor();
  }
}
