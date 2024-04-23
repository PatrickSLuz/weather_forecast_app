import 'package:weather_forecast_app/app/domain/models/city_model.dart';

abstract class CityRepository {
  Future<num> save(CityModel city);
  Future<List<CityModel>> getAll();
  Future<void> delete(int id);
}
