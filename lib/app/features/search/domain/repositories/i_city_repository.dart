import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';

abstract class ICityRepository {
  Future<num> save(CityModel city);

  Future<List<CityModel>> getAll();

  Future<void> delete(int id);
}
