import 'package:weather_forecast_app/old/app/features/forecast/domain/models/forecast_model.dart';

abstract class IForecastRepository {
  Future<ForecastModel?> getForecast(num? lat, num? lng);
}
