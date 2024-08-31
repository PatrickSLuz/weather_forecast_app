import 'package:weather_forecast_app/core/client/dio/rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';

class WeatherRestClientDioImpl extends RestClientDioImpl
    implements IWeatherRestClient {
  WeatherRestClientDioImpl(super.dio);
}
