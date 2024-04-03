import 'package:weather_forecast_app/app/domain/models/location_model.dart';

class LocationAdapter {
  LocationAdapter._();

  static LocationModel fromMap(Map<String, dynamic> map) {
    return LocationModel(
      currentDate: map['dt'],
      city: map['name'],
      country: map['sys']['country'] ?? '',
      timezone: map['timezone'],
      sunrise: map['sys']['sunrise'],
      sunset: map['sys']['sunset'],
    );
  }
}
