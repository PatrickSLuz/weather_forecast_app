import 'rest_client_http_message.dart';

class RestClientRequest implements RestClientHttpMessage {
  final String path;
  final dynamic data;
  final String method;
  final String baseUrl;
  final String urlSuffix;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;

  RestClientRequest({
    required this.path,
    this.data,
    this.method = 'GET',
    this.baseUrl = '',
    this.urlSuffix = '',
    this.queryParameters,
    this.headers,
  });

  RestClientRequest copyWith({
    String? path,
    dynamic data,
    String? method,
    String? urlSuffix,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return RestClientRequest(
      path: path ?? this.path,
      data: data ?? this.data,
      method: method ?? this.method,
      urlSuffix: urlSuffix ?? this.urlSuffix,
      queryParameters: queryParameters ?? this.queryParameters,
      headers: headers ?? this.headers,
    );
  }
}
