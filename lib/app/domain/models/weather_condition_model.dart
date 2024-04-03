import 'package:weather_forecast_app/app/shared/assets/assets.dart';

class WeatherConditionModel {
  /// Weather condition id
  final num id;

  /// Group of weather parameters (Rain, Snow, Clouds etc.)
  final String main;

  /// Weather condition within the group.
  /// You can get the output in your language
  final String description;

  /// (icon) Weather icon id
  final String iconId;

  WeatherConditionModel({
    required this.id,
    required this.main,
    required this.description,
    required this.iconId,
  });

  WeatherConditionModel copyWith({
    num? id,
    String? main,
    String? description,
    String? iconId,
  }) {
    return WeatherConditionModel(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      iconId: iconId ?? this.iconId,
    );
  }

  String get asset {
    switch (iconId) {
      case '01d':
        return Assets.sun;
      case '01n':
        return Assets.moon;
      case '02d':
        return Assets.cloudDay;
      case '02n':
        return Assets.cloudNight;
      case '03d':
      case '03n':
        return Assets.cloud;
      case '04d':
        return Assets.cloudsDay;
      case '04n':
        return Assets.cloudsNight;
      case '09d':
      case '09n':
        return Assets.rain;
      case '10d':
        return Assets.cloudRainDay;
      case '10n':
        return Assets.cloudRainNight;
      case '11d':
        return Assets.storm;
      case '11n':
        return Assets.stormNight;
      case '13d':
        return Assets.snowDay;
      case '13n':
        return Assets.snowNight;
      case '50d':
        return Assets.mistDay;
      case '50n':
        return Assets.mistNight;
      default:
        return Assets.clouds;
    }
  }
}
