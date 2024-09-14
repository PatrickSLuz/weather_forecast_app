import 'package:weather_forecast_app/app/features/weather/domain/models/forecast_model.dart';

abstract class IWeatherRepository {
  Future<ForecastModel?> getForecast(num? lat, num? lng);
}
