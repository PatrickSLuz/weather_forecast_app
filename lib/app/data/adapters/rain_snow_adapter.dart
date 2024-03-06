import 'package:weather_forecast_app/app/interactor/models/rain_snow_model.dart';

class RainSnowAdapter {
  RainSnowAdapter._();

  static RainSnowModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    return RainSnowModel(
      last1Hour: map['1h'],
      last3Hour: map['3h'],
    );
  }
}
