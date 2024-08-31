import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';

class CityAdapter {
  CityAdapter._();

  static CityModel fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['city'],
      state: map['state'] ?? map['county'] ?? map['country'],
      countryCode: map['country_code'],
      lat: map['lat'],
      lng: map['lon'],
    );
  }

  static CityModel fromDbMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'],
      name: map['name'],
      state: map['state'],
      countryCode: map['country_code'],
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  static Map<String, dynamic> toDbMap(CityModel city) {
    return {
      'id': city.id,
      'name': city.name,
      'state': city.state,
      'country_code': city.countryCode,
      'lat': city.lat,
      'lng': city.lng,
    };
  }
}
