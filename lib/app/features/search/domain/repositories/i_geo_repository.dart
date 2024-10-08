import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';

abstract class IGeoRepository {
  Future<List<CityModel>?> searchCity(String text);
}
