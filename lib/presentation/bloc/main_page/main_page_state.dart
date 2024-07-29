part of 'main_page_cubit.dart';

enum MainPageStatus {
  init,
  error,
  idle,
}

class MainPageState extends Equatable {
  final MainPageStatus status;
  final String errorMessage;
  final Color? backgroundColor;

  const MainPageState({
    required this.status,
    this.errorMessage = '',
    this.backgroundColor,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        backgroundColor,
      ];

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
