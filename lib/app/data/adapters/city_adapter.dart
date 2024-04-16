import 'package:weather_forecast_app/app/domain/models/city_model.dart';

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
}
