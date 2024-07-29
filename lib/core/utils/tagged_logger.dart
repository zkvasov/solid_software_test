import 'package:logger/logger.dart';

/// Custom tagged logger
class TaggedLogger implements Logger {
  /// print logs with [tag]
  final String tag;

  /// base [Logger]
  final Logger logger;

  @override
  Future<void> get init {
    return Logger().init;
  }

  const TaggedLogger._(this.tag, this.logger);

  @override
  void log(
    Level level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger.log(
      level,
      '[$tag] $message',
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void v(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.trace,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.debug,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.info,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.warning,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.error,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void f(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.fatal,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  Future<void> close() async {
    await logger.close();
  }

  @override
  bool isClosed() => false;

  @override
  void t(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.trace,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void wtf(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.fatal,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// [TaggedLogger]
extension TaggedLoggerExt on Logger {
  /// logger with [runtimeType] tag
  Logger of(Object caller) => ofTag('${caller.runtimeType}');

  /// logger with tags
  Logger ofTag(String tag) => TaggedLogger._(tag, this);
}
