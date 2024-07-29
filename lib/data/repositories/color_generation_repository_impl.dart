import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:solid_software/core/utils/color_util.dart';
import 'package:solid_software/domain/repositories/color_generation_repository.dart';

/// Generates random colors
@Injectable(as: ColorGenerationRepository)
class ColorGenerationRepositoryImpl implements ColorGenerationRepository {
  @override
  Color getRandomRGBColor() {
    return ColorUtil.getRandomColor();
  }
}
