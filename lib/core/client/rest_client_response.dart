import 'package:weather_forecast_app/core/client/rest_client_http_message.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';

class RestClientResponse implements RestClientHttpMessage {
  dynamic data;
  int? statusCode;
  String? message;
  RestClientRequest request;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
    required this.request,
  });
}
