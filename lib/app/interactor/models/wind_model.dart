class WindModel {
  /// Wind speed.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final num speed;

  /// (deg) Wind direction, degrees (meteorological)
  final num degrees;

  /// Wind gust.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final num gust;

  WindModel({
    required this.speed,
    required this.degrees,
    required this.gust,
  });

  WindModel copyWith({
    num? speed,
    num? degrees,
    num? gust,
  }) {
    return WindModel(
      speed: speed ?? this.speed,
      degrees: degrees ?? this.degrees,
      gust: gust ?? this.gust,
    );
  }
}
