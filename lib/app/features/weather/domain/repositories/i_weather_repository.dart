import 'package:weather_forecast_app/app/features/weather/domain/cubits/weather_cubit.dart';

abstract class IWeatherRepository {
  Future<WeatherState> getWeather(num lat, num lng);
}
