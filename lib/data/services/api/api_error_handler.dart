import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:weather_forecast_app/data/exceptions/app_exception.dart';
import 'package:weather_forecast_app/data/exceptions/exceptions.dart';

Exception getException(
  ResultDart<Response, Exception> result,
  String messageOnNull,
) {
  final exception = result.exceptionOrNull();

  if (exception == null) {
    return DefaultException(messageOnNull);
  }

  if (exception is AppException) {
    final message = exception.message;
    if (message.isNotEmpty) {
      return DefaultException(message);
    }
  }

  return exception;
}
