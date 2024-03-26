class WindModel {
  /// Wind speed.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final num speed;

  /// (deg) Wind direction, degrees (meteorological)
  final num degrees;

  /// Wind gust.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final num? gust;

  WindModel({
    required this.speed,
    required this.degrees,
    required this.gust,
  });

  String get compassDirection {
    if (degrees >= 20 && degrees < 40) {
      return 'Norte/Nordeste';
    } else if (degrees >= 40 && degrees < 60) {
      return 'Nordeste';
    } else if (degrees >= 60 && degrees < 80) {
      return 'Leste/Nordeste';
    } else if (degrees >= 80 && degrees < 110) {
      return 'Leste';
    } else if (degrees >= 110 && degrees < 130) {
      return 'Leste/Sudeste';
    } else if (degrees >= 130 && degrees < 150) {
      return 'Sudeste';
    } else if (degrees >= 150 && degrees < 170) {
      return 'Sul/Sudeste';
    } else if (degrees >= 170 && degrees < 200) {
      return 'Sul';
    } else if (degrees >= 200 && degrees < 220) {
      return 'Sul/Sudoeste';
    } else if (degrees >= 220 && degrees < 240) {
      return 'Sudoeste';
    } else if (degrees >= 240 && degrees < 260) {
      return 'Oeste/Sudoeste';
    } else if (degrees >= 260 && degrees < 290) {
      return 'Oeste';
    } else if (degrees >= 290 && degrees < 310) {
      return 'Oeste/Noroeste';
    } else if (degrees >= 310 && degrees < 330) {
      return 'Noroeste';
    } else if (degrees >= 330 && degrees < 350) {
      return 'Norte/Noroeste';
    } else {
      return 'Norte';
    }
  }

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
