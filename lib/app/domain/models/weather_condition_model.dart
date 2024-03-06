class WeatherConditionModel {
  /// Weather condition id
  final num id;

  /// Group of weather parameters (Rain, Snow, Clouds etc.)
  final String main;

  /// Weather condition within the group.
  /// You can get the output in your language
  final String description;

  /// (icon) Weather icon id
  final String iconId;

  WeatherConditionModel({
    required this.id,
    required this.main,
    required this.description,
    required this.iconId,
  });

  WeatherConditionModel copyWith({
    num? id,
    String? main,
    String? description,
    String? iconId,
  }) {
    return WeatherConditionModel(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      iconId: iconId ?? this.iconId,
    );
  }
}
