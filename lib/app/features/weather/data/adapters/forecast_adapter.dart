import 'package:weather_forecast_app/app/features/weather/data/adapters/location_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/weather_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/forecast_model.dart';

class ForecastAdapter {
  ForecastAdapter._();

  static ForecastModel fromMap(Map<String, dynamic> map) {
    final weathersMap = map['list'] as List;
    final weathers = weathersMap
        .map((data) => WeatherAdapter.fromMap(data, map['city']['timezone']))
        .toList();

    return ForecastModel(
      location: LocationAdapter.fromMap(map['city']),
      weathers: weathers,
    );
  }
}
