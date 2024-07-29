part of 'main_page_cubit.dart';

/// BLoC State of [MainPage]
class MainPageState extends Equatable {
  /// Status of [MainPage]
  final MainPageStatus status;

  /// error to notify user
  final String errorMessage;

  /// Scaffold backgroundColor
  final Color? backgroundColor;

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        backgroundColor,
      ];

  /// BLoC State of [MainPage]
  const MainPageState({
    required this.status,
    this.errorMessage = '',
    this.backgroundColor,
  });

  /// copyWith()
  MainPageState copyWith({
    MainPageStatus? status,
    String? errorMessage,
    Color? backgroundColor,
  }) {
    return MainPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

/// Status of [MainPage]
enum MainPageStatus {
  /// init
  init,

  /// error
  error,

  /// idle/common
  idle,
}
