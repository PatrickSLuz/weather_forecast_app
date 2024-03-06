import 'package:weather_forecast_app/app/interactor/models/cloudiness_model.dart';

class CloudinessAdapter {
  CloudinessAdapter._();

  static CloudinessModel fromMap(Map<String, dynamic> map) {
    return CloudinessModel(
      percent: map['all'],
    );
  }
}
