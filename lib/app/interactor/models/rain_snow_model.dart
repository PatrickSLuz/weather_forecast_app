class RainSnowModel {
  /// (1h) (where available) Rain/Snow volume for the last 1 hour, mm.
  /// Please note that only mm as units of measurement are available for this parameter
  final num? last1Hour;

  /// (3h) (where available) Rain/Snow volume for the last 3 hours, mm.
  /// Please note that only mm as units of measurement are available for this parameter
  final num? last3Hour;

  RainSnowModel({
    this.last1Hour,
    this.last3Hour,
  });

  RainSnowModel copyWith({
    num? last1Hour,
    num? last3Hour,
  }) {
    return RainSnowModel(
      last1Hour: last1Hour ?? this.last1Hour,
      last3Hour: last3Hour ?? this.last3Hour,
    );
  }
}
