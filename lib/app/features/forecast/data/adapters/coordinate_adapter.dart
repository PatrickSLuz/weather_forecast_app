import 'package:weather_forecast_app/app/features/forecast/domain/models/coordinate_model.dart';

class CoordinateAdapter {
  CoordinateAdapter._();

  static Map<String, dynamic> toMap(CoordinateModel coordinate) {
    return {
      'lat': coordinate.lat,
      'lon': coordinate.lng,
    };
  }

  static CoordinateModel fromMap(Map<String, dynamic> map) {
    return CoordinateModel(
      lat: map['lat'],
      lng: map['lon'],
    );
  }
}
