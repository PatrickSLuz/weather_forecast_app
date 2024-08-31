import 'package:weather_forecast_app/app/features/weather/domain/models/weather_detail_model.dart';

class WeatherDetailAdapter {
  WeatherDetailAdapter._();

  static WeatherDetailModel fromMap(Map<String, dynamic> map) {
    return WeatherDetailModel(
      temperature: map['temp'],
      feelsLike: map['feels_like'],
      tempMin: map['temp_min'],
      tempMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      seaLevel: map['sea_level'],
      groundLevel: map['grnd_level'],
    );
  }
}
