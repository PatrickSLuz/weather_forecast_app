class CityModel {
  final int? id;
  final String name;
  final String state;
  final String countryCode;
  final num lat;
  final num lng;

  CityModel({
    this.id,
    required this.name,
    required this.state,
    required this.countryCode,
    required this.lat,
    required this.lng,
  });

  CityModel copyWith({
    int? id,
    String? name,
    String? state,
    String? countryCode,
    num? lat,
    num? lng,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      countryCode: countryCode ?? this.countryCode,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
