import 'package:weather_forecast_app/app/features/forecast/domain/models/wind_model.dart';

class WindAdapter {
  WindAdapter._();

  static WindModel fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed'],
      degrees: map['deg'],
      gust: map['gust'],
    );
  }
}
