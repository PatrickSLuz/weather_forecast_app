import 'package:weather_forecast_app/app/features/weather/domain/models/cloudiness_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/coordinate_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/rain_snow_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_condition_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_detail_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/wind_model.dart';

class WeatherModel {
  /// location data
  final LocationModel location;

  ///  Visibility, meter. The maximum value of the visibility is 10 km
  final num? visibility;

  /// coord
  final CoordinateModel coordinate;

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
    required this.location,
    required this.visibility,
    required this.coordinate,
    required this.condition,
    required this.detail,
    required this.wind,
    required this.cloudiness,
    this.rain,
    this.snow,
  });

  WeatherModel copyWith({
    LocationModel? location,
    num? visibility,
    CoordinateModel? coordinate,
    WeatherConditionModel? condition,
    WeatherDetailModel? detail,
    WindModel? wind,
    CloudinessModel? cloudiness,
    rain,
    snow,
  }) {
    return WeatherModel(
      location: location ?? this.location,
      visibility: visibility ?? this.visibility,
      coordinate: coordinate ?? this.coordinate,
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
