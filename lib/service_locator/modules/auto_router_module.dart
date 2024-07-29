import 'package:injectable/injectable.dart';
import 'package:solid_software/presentation/router/app_auto_router.dart';

/// Injecting [AppAutoRouter]
@module
abstract class AutoRouterModule {
  /// Injecting [AppAutoRouter]
  @singleton
  AppAutoRouter appAutoRouter() => AppAutoRouter();
}
