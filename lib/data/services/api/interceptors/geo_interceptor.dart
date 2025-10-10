import 'package:dio/dio.dart';
import 'package:weather_forecast_app/config/constants/error_messages.dart';
import 'package:weather_forecast_app/config/env/env.dart';
import 'package:weather_forecast_app/config/l10n/internationalization.dart';
import 'package:weather_forecast_app/data/services/api/console_logger/api_console_logger.dart';

InterceptorsWrapper geoInterceptor() {
  return InterceptorsWrapper(
    onRequest: _onRequest,
    onResponse: _onResponse,
    onError: _onError,
  );
}

void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  options.headers['Content-Type'] = 'application/json';
  options.headers['Accept'] = 'application/json';
  options.headers['format'] = 'json';
  options.headers['lang'] = AppI10n.instance.locale.substring(0, 2);
  options.headers['apiKey'] = Env.geoApiKey;

  ApiConsoleLogger.logRequest(options);
  handler.next(options);
}

void _onResponse(Response response, ResponseInterceptorHandler handler) {
  ApiConsoleLogger.logResponse(response);

  final statusCode = response.statusCode ?? 0;
  if (statusCode < 200 || statusCode > 299) {
    handler.reject(DioException(
      response: response,
      requestOptions: response.requestOptions,
      message: ErrorMessage.getByStatusCode(statusCode),
    ));
    return;
  }

  handler.next(response);
}

void _onError(DioException error, ErrorInterceptorHandler handler) {
  ApiConsoleLogger.logError(error);
  handler.reject(error);
}
