class WeatherDetailModel {
  /// (temp) Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
  final num temperature;

  /// (feels_like) This temperature parameter accounts for the human perception of weather
  final num feelsLike;

  /// (temp_min) Minimum temperature at the moment. This is minimal currently observed
  /// temperature (within large megalopolises and urban areas)
  final num tempMin;

  /// (temp_max) Maximum temperature at the moment. This is maximal currently observed
  /// temperature (within large megalopolises and urban areas)
  final num tempMax;

  ///  Atmospheric pressure on the sea level, hPa
  final num pressure;

  /// Humidity, %
  final num humidity;

  /// (sea_level) Atmospheric pressure on the sea level, hPa
  final num? seaLevel;

  /// (grnd_level) Atmospheric pressure on the ground level, hPa
  final num? groundLevel;

  WeatherDetailModel({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.groundLevel,
  });

  WeatherDetailModel copyWith({
    num? temperature,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? groundLevel,
  }) {
    return WeatherDetailModel(
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      groundLevel: groundLevel ?? this.groundLevel,
    );
  }
}
