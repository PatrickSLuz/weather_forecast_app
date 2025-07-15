import 'package:weather_forecast_app/old/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/old/core/client/interceptor/client_interceptor_impl.dart';
import 'package:weather_forecast_app/old/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/old/app/shared/env/environment.dart';
import 'package:weather_forecast_app/old/l10n/internationalization.dart';

class GeoClientInterceptorImpl extends ClientInterceptorImpl
    implements IClientInterceptor {
  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    request.queryParameters?['format'] = 'json';
    request.queryParameters?['lang'] = AppIntl.currentLocale.substring(0, 2);
    request.queryParameters?['apiKey'] = Environment.geoApiKey;

    logRequest(request);
    return request;
  }
}
