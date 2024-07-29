import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Injecting [Logger]
@module
abstract class LoggerModule {
  /// Injecting [Logger]
  @singleton
  Logger logger() {
    const minLogLevel = kDebugMode ? Level.trace : Level.warning;

    return Logger(
      filter: ProductionFilter()..level = minLogLevel,
      printer: PrettyPrinter(
        methodCount: 0,
      ),
    );
  }
}
