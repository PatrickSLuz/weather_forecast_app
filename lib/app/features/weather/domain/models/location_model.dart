import 'package:weather_forecast_app/core/extensions/num_extension.dart';

class LocationModel {
  /// (timezone) Time of data calculation, unix, UTC
  final num currentDate;

  /// (name) City name
  final String city;

  /// (sys.country) Country Name
  final String country;

  /// Shift in seconds from UTC
  final num timezone;

  /// Sunrise time, unix, UTC
  final num sunrise;

  /// Sunset time, unix, UTC
  final num sunset;

  LocationModel({
    required this.currentDate,
    required this.city,
    required this.country,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  DateTime get currentDateTime => currentDate.toDate(timezone);
  String get dateFormatted => currentDate.formatToDate(timezone);
  String get sunriseFormatted => sunrise.formatToDate(timezone, 'HH:mm');
  String get sunsetFormatted => sunset.formatToDate(timezone, 'HH:mm');
}
