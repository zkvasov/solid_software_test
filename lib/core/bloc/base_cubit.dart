import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:solid_software/core/error/lost_connection_exception.dart';
import 'package:solid_software/core/utils/tagged_logger.dart';
import 'package:solid_software/service_locator/service_locator.dart';

/// Error handling in BLoC/Cubit
abstract class BaseCubit<TState> extends Cubit<TState> {
  /// Logs exceptions
  Logger get logger => sl<Logger>().of(this);

  /// Error handling in BLoC/Cubit
  BaseCubit(super.initialState);

  /// handed and parsed [errorMessage]
  void handleError(String errorMessage);

  /// Handles determined exceptions [PlatformException],
  /// [LostConnectionException], and default
  /// Parses exceptions in error message [String]
  Future<void> performErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } on PlatformException catch (exception, stackTrace) {
      logger.e(
        'PlatformException in performErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    } on LostConnectionException catch (exception, stackTrace) {
      logger.e(
        'Lost connection error in performErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    } catch (exception, stackTrace) {
      logger.e(
        'Error in performErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    }
  }
}
