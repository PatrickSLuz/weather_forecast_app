import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/shared/environment/environment.dart';

class DioInterceptor {
  static final interceptorsWrapper = InterceptorsWrapper(
    onRequest: _onRequest,
    onResponse: _onResponse,
    onError: _onError,
  );

  static void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll(
      {
        'appid': Environment.apiAppId,
        'mode': 'json',
      },
    );

    log('----- REQUEST -----');
    log('Method.${options.method}');
    log('Headers: ${options.headers}');
    log('Parameters: ${options.queryParameters}');
    log('Path URL: ${options.path}');
    log('-------------------');

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
}
