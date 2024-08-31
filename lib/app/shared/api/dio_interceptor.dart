import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/environment.dart';

class DioInterceptor {
  DioInterceptor._();

  static final weatherInterceptorsWrapper = InterceptorsWrapper(
    onRequest: _weatherOnRequest,
    onResponse: _onResponse,
    onError: _onError,
  );

  static final geoInterceptorsWrapper = InterceptorsWrapper(
    onRequest: _geoOnRequest,
    onResponse: _onResponse,
    onError: _onError,
  );

  static void _weatherOnRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll(
      {
        'appid': Environment.weatherApiAppId,
        'mode': 'json',
        'lang': 'pt_br',
      },
    );

    _showRequestLog(options);

    return handler.next(options);
  }

  static void _geoOnRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll(
      {
        'apiKey': Environment.geoApiKey,
        'lang': 'pt',
        'format': 'json',
      },
    );

    _showRequestLog(options);

    return handler.next(options);
  }

  static void _onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log('----- RESPONSE -----');
    log('Path URL: ${response.requestOptions.path}');
    log('Status Code: ${response.statusCode}');
    log('Body: ${response.data}');

    return handler.next(response);
  }

  static void _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    log('----- DIO ERROR -----');
    log('Path URL: ${error.requestOptions.path}');
    log('Status Code: ${error.response?.statusCode}');

    return handler.next(error);
  }

  static void _showRequestLog(RequestOptions options) {
    log('----- REQUEST -----');
    log('Method.${options.method} - Path URL: ${options.path}');
    if (options.headers.isNotEmpty) {
      log('Headers: ${options.headers}');
    }
    if (options.queryParameters.isNotEmpty) {
      log('Parameters: ${options.queryParameters}');
    }
  }
}
