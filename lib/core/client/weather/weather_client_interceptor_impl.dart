import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/interceptor/client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/app/shared/env/environment.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class WeatherClientInterceptorImpl extends ClientInterceptorImpl
    implements IClientInterceptor {
  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    request.queryParameters?['mode'] = 'json';
    request.queryParameters?['lang'] = AppIntl.currentLocale.toLowerCase();
    request.queryParameters?['appid'] = Environment.weatherApiAppId;

    logRequest(request);
    return request;
  }
}
