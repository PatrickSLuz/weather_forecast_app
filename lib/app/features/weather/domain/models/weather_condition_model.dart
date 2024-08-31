import 'package:weather_forecast_app/design_system/assets/app_assets.dart';

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
        return AppAssets.sun;
      case '01n':
        return AppAssets.moon;
      case '02d':
        return AppAssets.cloudDay;
      case '02n':
        return AppAssets.cloudNight;
      case '03d':
      case '03n':
        return AppAssets.cloud;
      case '04d':
        return AppAssets.cloudsDay;
      case '04n':
        return AppAssets.cloudsNight;
      case '09d':
      case '09n':
        return AppAssets.rain;
      case '10d':
        return AppAssets.cloudRainDay;
      case '10n':
        return AppAssets.cloudRainNight;
      case '11d':
        return AppAssets.storm;
      case '11n':
        return AppAssets.stormNight;
      case '13d':
        return AppAssets.snowDay;
      case '13n':
        return AppAssets.snowNight;
      case '50d':
        return AppAssets.mistDay;
      case '50n':
        return AppAssets.mistNight;
      default:
        return AppAssets.clouds;
    }
  }
}
