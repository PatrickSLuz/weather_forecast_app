import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';

class ForecastModel {
  final LocationModel location;
  final List<WeatherModel> weathers;

  ForecastModel({
    required this.location,
    required this.weathers,
  });
}
