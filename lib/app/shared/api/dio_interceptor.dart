import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/shared/environment/environment.dart';

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
    log('Status Code: ${response.statusCode}');
    log('Path URL: ${response.requestOptions.path}');
    log('Body: ${response.data}');
    log('--------------------');

    return handler.next(response);
  }

  static void _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    log('----- DIO ERROR -----');
    log('Status Code: ${error.response?.statusCode}');
    log('Path URL: ${error.requestOptions.path}');
    log('---------------------');

    return handler.next(error);
  }

  static void _showRequestLog(RequestOptions options) {
    log('----- REQUEST -----');
    log('Method.${options.method}');
    log('Headers: ${options.headers}');
    log('Parameters: ${options.queryParameters}');
    log('Path URL: ${options.path}');
    log('-------------------');
  }
}
