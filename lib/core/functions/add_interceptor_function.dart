import 'package:weather_forecast_app/core/client/geo/geo_client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/client/geo/i_geo_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_client_interceptor_impl.dart';
import 'package:weather_forecast_app/injector.dart';

addInterceptors() {
  final weatherRestClient = getIt<IWeatherRestClient>();
  final geoRestClient = getIt<IGeoRestClient>();

  weatherRestClient.addInterceptors(WeatherClientInterceptorImpl());
  geoRestClient.addInterceptors(GeoClientInterceptorImpl());
}
