import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:solid_software/core/utils/tagged_logger.dart';

import '../../service_locator/service_locator.dart';
import '../error/exception.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(super.initialState);

  void handleError(String errorMessage);

  Logger get logger => sl<Logger>().of(this);

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
    } on ServerException catch (exception, stackTrace) {
      logger.e(
        'ServerException in performErrorHandledCall()',
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
