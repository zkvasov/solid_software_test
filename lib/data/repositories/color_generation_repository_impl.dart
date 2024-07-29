import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:solid_software/core/utils/color_helpers.dart';

import '../../domain/repositories/color_generation_repository.dart';

@Injectable(as: ColorGenerationRepository)
class ColorGenerationRepositoryImpl implements ColorGenerationRepository {
  @override
  Color getRandomRGBColor() {
    return ColorUtil.getRandomColor();
  }
}
