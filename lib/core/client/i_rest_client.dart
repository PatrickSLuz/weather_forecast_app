import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/rest_client_multipart.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';

abstract interface class IRestClient {
  Future<RestClientResponse> post(RestClientRequest request);

  Future<RestClientResponse> get(RestClientRequest request);

  Future<RestClientResponse> put(RestClientRequest request);

  Future<RestClientResponse> delete(RestClientRequest request);

  Future<RestClientResponse> patch(RestClientRequest request);

  Future<RestClientResponse> upload(RestClientMultipart multipart);

  void addInterceptors(IClientInterceptor interceptor);

  void removeInterceptors(IClientInterceptor interceptor);
}
