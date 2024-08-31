import 'dart:async';
import 'dart:developer';

import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/rest_client_exception.dart';
import 'package:weather_forecast_app/core/client/rest_client_http_message.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';
import 'package:weather_forecast_app/core/errors/error_message.dart';

class ClientInterceptorImpl implements IClientInterceptor {
  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    logRequest(request);
    return request;
  }

  @override
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response) {
    logResponse(response);
    return response;
  }

  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) async {
    logError(error);
    final response = error.response;
    final statusCode = response?.statusCode ?? 0;

    String message = '';

    switch (statusCode) {
      case 403:
        message = ErrorMessage.forbidden;
        break;
      case 404:
        message = ErrorMessage.notFound;
        break;
      case 500:
        message = ErrorMessage.internalServerError;
        break;
      case 503:
        message = ErrorMessage.serviceUnavailable;
        break;
      default:
        message = ErrorMessage.generic;
    }

    return RestClientException(
      message: message,
      error: null,
      statusCode: statusCode,
    );
  }

  void logRequest(RestClientRequest request) {
    final params = _handleQueryParameters(request.queryParameters);
    log('Request: Method.${request.method}');
    log('URL: ${request.baseUrl}${request.path}$params');
    // log('Header: ${request.headers}');
  }

  void logResponse(RestClientResponse response) {
    final params = _handleQueryParameters(response.request.queryParameters);
    log('Response: StatusCode ${response.statusCode}');
    log('URL: ${response.request.baseUrl}${response.request.path}$params');
  }

  void logError(RestClientException error) {
    final response = error.response;
    final params = _handleQueryParameters(response?.request.queryParameters);
    log('Error: StatusCode ${response?.statusCode}');
    log('URL: ${response?.request.baseUrl}${response?.request.path}$params');
  }

  String _handleQueryParameters(Map<String, dynamic>? queryParameters) {
    try {
      if (queryParameters != null && queryParameters.isNotEmpty) {
        String params = '?';
        params += queryParameters.entries
            .map((param) => '${param.key}=${param.value}')
            .toString();
        params = params.replaceAll('(', '').replaceAll(')', '');
        params = params.replaceAll(', ', '&');
        return params.trim();
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}
