import 'package:weather_forecast_app/app/features/forecast/domain/models/coordinate_model.dart';

class LocationModel {
  /// (name) City name
  final String city;

  /// (sys.country) Country Name
  final String country;

  /// Shift in seconds from UTC
  final num timezone;

  /// coordinates of location
  final CoordinateModel coordinate;

  /// Sunrise time, unix, UTC
  final DateTime sunrise;

  /// Sunset time, unix, UTC
  final DateTime sunset;

  LocationModel({
    required this.city,
    required this.country,
    required this.timezone,
    required this.coordinate,
    required this.sunrise,
    required this.sunset,
  });
}
