import 'package:weather_forecast_app/app/domain/models/weather_condition_model.dart';

class WeatherConditionAdapter {
  WeatherConditionAdapter._();

  static WeatherConditionModel fromMap(Map<String, dynamic> map) {
    return WeatherConditionModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      iconId: map['icon'],
    );
  }
}
