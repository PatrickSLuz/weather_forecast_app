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

    final errorMsg = _getErrorOnResponse(response);

    if (errorMsg != null && errorMsg.isNotEmpty) {
      return RestClientException(
        message: errorMsg,
        error: null,
        statusCode: 400,
      );
    }

    return response;
  }

  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) async {
    logError(error);
    final response = error.response;
    final statusCode = response?.statusCode ?? 0;

    if (statusCode == 401) {
      logout();
      return error;
    }

    final hasData = response?.data != null;
    final dataIsHtml = response?.data?.toString().contains('<html>') ?? false;
    if (!hasData || dataIsHtml) {
      String message = ErrorMessage.generic;

      if (response != null &&
          response.message != null &&
          response.message!.isNotEmpty) {
        message = response.message!;
      }

      return RestClientException(
        message: message,
        error: error,
        statusCode: statusCode,
      );
    }

    final responseError = response?.data['errorList'][0];
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
        message = '${responseError['message'] ?? ''}';
    }

    if (message.isEmpty) {
      message = ErrorMessage.generic;
    }

    return RestClientException(
      message: message,
      error: responseError,
      statusCode: statusCode,
    );
  }

  void logout() async {}

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

  String? _getErrorOnResponse(RestClientResponse response) {
    final data = response.data;
    if (data == null) return null;
    if (data is! Map) return null;

    if (!data.containsKey('success')) return null;
    if (data['success'] == true) return null;

    if (!data.containsKey('errors')) return null;
    final errors = data['errors'];
    if (errors is! List) return null;

    final error = errors.first.toString();
    if (error.isNotEmpty) return error;

    return null;
  }
}
