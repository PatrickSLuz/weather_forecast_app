import 'dart:async';

import 'package:weather_forecast_app/core/client/rest_client_exception.dart';
import 'package:weather_forecast_app/core/client/rest_client_http_message.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';

abstract interface class IClientInterceptor {
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response);
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request);
  FutureOr<RestClientHttpMessage> onError(RestClientException error);
}
