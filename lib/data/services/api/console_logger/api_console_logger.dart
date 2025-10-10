import 'dart:developer';

import 'package:dio/dio.dart';

sealed class ApiConsoleLogger {
  static void logRequest(
    RequestOptions options, {
    bool showHeaders = true,
    bool showBaseUrl = true,
  }) {
    final params = _handleQueryParameters(options.queryParameters);
    log('Request: Method.${options.method}');
    if (showBaseUrl) {
      log('BaseUrl: ${options.baseUrl}');
    }
    log('Path: ${options.path}$params');
    if (showHeaders) {
      log('Header: ${options.headers}');
    }
  }

  static void logResponse(Response<dynamic> response) {
    final params = _handleQueryParameters(
      response.requestOptions.queryParameters,
    );
    log('Response: StatusCode ${response.statusCode}');
    log('Path: ${response.requestOptions.path}$params');
    log('Body: ${response.data}');
  }

  static void logError(DioException error) {
    final response = error.response;
    final params = _handleQueryParameters(
      response?.requestOptions.queryParameters,
    );
    log('Response Error: StatusCode ${response?.statusCode}');
    log('Path: ${response?.requestOptions.path}$params');
    log('Error: ${error.message} - ${error.error}');
  }

  static String _handleQueryParameters(Map<String, dynamic>? queryParameters) {
    try {
      if (queryParameters != null && queryParameters.isNotEmpty) {
        final params = StringBuffer('?');
        for (var entry in queryParameters.entries) {
          params.write('&${entry.key}=${entry.value}');
        }
        return params.toString();
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}
