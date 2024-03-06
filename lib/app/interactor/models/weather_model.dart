import 'package:weather_forecast_app/app/interactor/models/cloudiness_model.dart';
import 'package:weather_forecast_app/app/interactor/models/coordinate_model.dart';
import 'package:weather_forecast_app/app/interactor/models/rain_snow_model.dart';
import 'package:weather_forecast_app/app/interactor/models/weather_condition_model.dart';
import 'package:weather_forecast_app/app/interactor/models/weather_detail_model.dart';
import 'package:weather_forecast_app/app/interactor/models/wind_model.dart';

class WeatherModel {
  /// (timezone) Time of data calculation, unix, UTC
  final num currentDate;

  /// (name) City name
  final String cityName;

  ///  Visibility, meter. The maximum value of the visibility is 10 km
  final num visibility;

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
    required this.currentDate,
    required this.cityName,
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
    num? currentDate,
    String? cityName,
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
      currentDate: currentDate ?? this.currentDate,
      cityName: cityName ?? this.cityName,
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
}
