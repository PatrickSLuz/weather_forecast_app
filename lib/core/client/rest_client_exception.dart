import 'package:weather_forecast_app/core/client/rest_client_http_message.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    super.statusCode,
    super.data,
    required this.error,
    this.response,
    super.stackTracing,
  });
}
