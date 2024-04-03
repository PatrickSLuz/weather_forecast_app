import 'package:weather_forecast_app/app/domain/models/city_model.dart';

abstract class GeoDatasource {
  Future<List<CityModel>> searchCity(String text);
}
