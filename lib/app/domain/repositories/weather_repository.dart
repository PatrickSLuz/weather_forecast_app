import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';

abstract class WeatherRepository {
  Future<WeatherState> getWeather(num lat, num lng);
}
