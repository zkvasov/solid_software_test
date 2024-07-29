import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_software/domain/use_cases/color_generation_use_cases.dart';

import '../../../core/bloc/base_cubit.dart';

part 'main_page_state.dart';

@injectable
class MainPageCubit extends BaseCubit<MainPageState> {
  final ColorGenerationUseCases _colorGenerationUseCases;

  MainPageCubit(
    this._colorGenerationUseCases,
  ) : super(const MainPageState(
          status: MainPageStatus.init,
        ));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: MainPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void getRandomBackgroundColor() {
    performErrorHandledCall(() async {
      final color = _colorGenerationUseCases.getRandomRGBColor();
      emit(state.copyWith(
        status: MainPageStatus.idle,
        backgroundColor: color,
      ));
    });
  }
}
