class CoordinateModel {
  /// (lat) Latitude of the location
  final num lat;

  /// (lon) Longitude of the location
  final num lng;

  CoordinateModel({
    required this.lat,
    required this.lng,
  });

  CoordinateModel copyWith({
    num? lat,
    num? lng,
  }) {
    return CoordinateModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
