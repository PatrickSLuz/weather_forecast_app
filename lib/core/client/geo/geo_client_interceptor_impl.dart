import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/interceptor/client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/environment.dart';

class GeoClientInterceptorImpl extends ClientInterceptorImpl
    implements IClientInterceptor {
  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    request.queryParameters?['format'] = 'json';
    request.queryParameters?['lang'] = 'pt';
    request.queryParameters?['apiKey'] = Environment.weatherApiAppId;

    logRequest(request);
    return request;
  }
}
