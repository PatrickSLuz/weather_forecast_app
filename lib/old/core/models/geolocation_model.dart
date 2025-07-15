class GeolocationModel {
  final num latitude;
  final num longitude;
  final DateTime timestamp;

  GeolocationModel({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  GeolocationModel copyWith({
    num? latitude,
    num? longitude,
    DateTime? timestamp,
  }) {
    return GeolocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
