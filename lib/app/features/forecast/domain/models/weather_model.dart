import 'package:weather_forecast_app/app/features/forecast/domain/models/cloudiness_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/rain_snow_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_condition_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_detail_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/wind_model.dart';

class WeatherModel {
  /// Time of data forecasted, unix, UTC
  final DateTime dateTime;

  /// Visibility, meter. The maximum value of the visibility is 10 km
  final num? visibility;

  /// Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
  final num? pop;

  /// weather
  final WeatherConditionModel condition;

  /// main
  final WeatherDetailModel detail;

  /// wind
  final WindModel wind;

  /// clouds
  final CloudinessModel cloudiness;

  /// (where available) Rain volumes
  final RainSnowModel? rain;

  /// (where available) Snow volumes
  final RainSnowModel? snow;

  WeatherModel({
    required this.dateTime,
    required this.visibility,
    required this.pop,
    required this.condition,
    required this.detail,
    required this.wind,
    required this.cloudiness,
    this.rain,
    this.snow,
  });

  WeatherModel copyWith({
    DateTime? dateTime,
    num? visibility,
    num? pop,
    WeatherConditionModel? condition,
    WeatherDetailModel? detail,
    WindModel? wind,
    CloudinessModel? cloudiness,
    rain,
    snow,
  }) {
    return WeatherModel(
      dateTime: dateTime ?? this.dateTime,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      condition: condition ?? this.condition,
      detail: detail ?? this.detail,
      wind: wind ?? this.wind,
      cloudiness: cloudiness ?? this.cloudiness,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
    );
  }

  String get visibilityFormatted {
    if (visibility == null) return '';
    if (visibility! < 1000) {
      return '$visibility m';
    } else if (visibility! < 10000) {
      return '${(visibility! / 1000).round()} km';
    }
    return '> 10 km';
  }
}
