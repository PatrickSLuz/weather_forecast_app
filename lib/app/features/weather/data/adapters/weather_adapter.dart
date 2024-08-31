import 'package:weather_forecast_app/app/features/weather/data/adapters/cloudiness_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/coordinate_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/location_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/rain_snow_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/weather_condition_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/weather_detail_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/wind_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';

class WeatherAdapter {
  WeatherAdapter._();

  static Map<String, dynamic> toMap(WeatherModel weather) {
    return {};
  }

  static WeatherModel fromMap(Map<String, dynamic> map) {
    final weathers = map['weather'] as List;
    return WeatherModel(
      location: LocationAdapter.fromMap(map),
      visibility: map['visibility'],
      coordinate: CoordinateAdapter.fromMap(map['coord']),
      condition: WeatherConditionAdapter.fromMap(weathers.first),
      detail: WeatherDetailAdapter.fromMap(map['main']),
      wind: WindAdapter.fromMap(map['wind']),
      cloudiness: CloudinessAdapter.fromMap(map['clouds']),
      rain: RainSnowAdapter.fromMap(map['rain']),
      snow: RainSnowAdapter.fromMap(map['snow']),
    );
  }
}
