import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_software/core/bloc/base_cubit.dart';
import 'package:solid_software/domain/use_cases/color_generation_use_cases.dart';
import 'package:solid_software/presentation/pages/main_page.dart';

part 'main_page_state.dart';

/// BLoC for [MainPage]
@injectable
class MainPageCubit extends BaseCubit<MainPageState> {
  final ColorGenerationUseCases _colorGenerationUseCases;

  /// BLoC for [MainPage]
  MainPageCubit(
    this._colorGenerationUseCases,
  ) : super(
          const MainPageState(
            status: MainPageStatus.init,
          ),
        );

  @override
  void handleError(String errorMessage) {
    emit(
      state.copyWith(
        status: MainPageStatus.error,
        errorMessage: errorMessage,
      ),
    );
  }

  /// Generates random color (from 16777216 colors)
  /// and sets it to [state].backgroundColor
  void getRandomBackgroundColor() {
    performErrorHandledCall(() async {
      final color = _colorGenerationUseCases.getRandomRGBColor();
      emit(
        state.copyWith(
          status: MainPageStatus.idle,
          backgroundColor: color,
        ),
      );
    });
  }
}
