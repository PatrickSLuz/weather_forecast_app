import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';

abstract class WeatherForecastRepository {
  Future<WeatherState> getWeatherForecast(num lat, num lng);
}
