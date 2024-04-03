import 'package:weather_forecast_app/app/domain/models/city_model.dart';

class CityAdapter {
  CityAdapter._();

  static CityModel fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['properties']['city'],
      state: map['properties']['state'],
      countryCode: map['properties']['country_code'],
      lat: map['properties']['lat'],
      lng: map['properties']['lon'],
    );
  }
}
