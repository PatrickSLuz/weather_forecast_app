import 'package:weather_forecast_app/app/features/forecast/data/adapters/cloudiness_adapter.dart';
import 'package:weather_forecast_app/app/features/forecast/data/adapters/rain_snow_adapter.dart';
import 'package:weather_forecast_app/app/features/forecast/data/adapters/weather_condition_adapter.dart';
import 'package:weather_forecast_app/app/features/forecast/data/adapters/weather_detail_adapter.dart';
import 'package:weather_forecast_app/app/features/forecast/data/adapters/wind_adapter.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/core/functions/convert_num_to_date_function.dart';

class WeatherAdapter {
  WeatherAdapter._();

  static WeatherModel fromMap(Map<String, dynamic> map, num timezone) {
    final weathers = map['weather'] as List;
    return WeatherModel(
      dateTime: convertNumToDateTime(map['dt'], timezone),
      visibility: map['visibility'],
      pop: map['pop'],
      condition: WeatherConditionAdapter.fromMap(weathers.first),
      detail: WeatherDetailAdapter.fromMap(map['main']),
      wind: WindAdapter.fromMap(map['wind']),
      cloudiness: CloudinessAdapter.fromMap(map['clouds']),
      rain: RainSnowAdapter.fromMap(map['rain']),
      snow: RainSnowAdapter.fromMap(map['snow']),
    );
  }
}
