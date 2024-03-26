class LocationModel {
  /// (name) City name
  final String city;

  /// (sys.country) Country Name
  final String country;

  /// Shift in seconds from UTC
  final num timezone;

  LocationModel({
    required this.city,
    required this.country,
    required this.timezone,
  });
}
