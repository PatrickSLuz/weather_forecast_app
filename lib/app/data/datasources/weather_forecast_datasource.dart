import 'package:weather_forecast_app/app/domain/models/weather_model.dart';

abstract class WeatherForecastDatasource {
  Future<WeatherModel> getWeatherData(num lat, num lng);
}
