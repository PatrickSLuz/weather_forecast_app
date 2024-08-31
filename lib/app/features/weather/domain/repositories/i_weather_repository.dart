import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';

abstract class IWeatherRepository {
  Future<WeatherModel?> getWeather(num? lat, num? lng);
}
